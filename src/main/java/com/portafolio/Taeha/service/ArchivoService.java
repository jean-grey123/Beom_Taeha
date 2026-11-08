package com.portafolio.Taeha.service;

import com.azure.core.util.BinaryData;
import com.azure.identity.ManagedIdentityCredentialBuilder;
import com.azure.storage.blob.BlobClient;
import com.azure.storage.blob.BlobContainerClient;
import com.azure.storage.blob.BlobServiceClientBuilder;
import com.azure.storage.blob.models.BlobStorageException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Locale;
import java.util.UUID;

@Service
public class ArchivoService {

    private final BlobContainerClient contenedor;

    private final Path carpetaImagenes =
            Paths.get("uploads", "imagenes")
                    .toAbsolutePath().normalize();

    private final Path carpetaArchivos =
            Paths.get("uploads", "archivos")
                    .toAbsolutePath().normalize();

    public ArchivoService(
            @Value("${AZURE_STORAGE_BLOB_ENDPOINT}") String endpoint,
            @Value("${AZURE_STORAGE_CONTAINER}") String nombreContenedor) {

        this.contenedor = new BlobServiceClientBuilder()
                .endpoint(endpoint)
                .credential(
                        new ManagedIdentityCredentialBuilder().build()
                )
                .buildClient()
                .getBlobContainerClient(nombreContenedor);
    }

    // Guardar imágenes nuevas en Azure.
    public String guardarImagen(MultipartFile archivo) {
        return guardar(archivo, "imagenes");
    }

    // Guardar documentos nuevos en Azure.
    public String guardarArchivo(MultipartFile archivo) {
        return guardar(archivo, "archivos");
    }

    private String guardar(MultipartFile archivo, String carpeta) {
        if (archivo == null || archivo.isEmpty()) {
            return null;
        }

        String original = archivo.getOriginalFilename();
        String extension = "";

        if (original != null) {
            int punto = original.lastIndexOf('.');

            if (punto >= 0) {
                String candidata = original.substring(punto)
                        .toLowerCase(Locale.ROOT);

                if (candidata.matches("\\.[a-z0-9]{1,10}")) {
                    extension = candidata;
                }
            }
        }

        String nombre = "az-" + UUID.randomUUID() + extension;

        try {
            BlobClient blob = contenedor.getBlobClient(
                    carpeta + "/" + nombre
            );

            blob.upload(BinaryData.fromBytes(archivo.getBytes()), false);

            // Se guarda un nombre estable en MySQL.
            // La aplicación lee el blob privado mediante su identidad.
            return nombre;

        } catch (IOException e) {
            throw new IllegalStateException(
                    "No se pudo leer el archivo para subirlo a Azure", e
            );
        }
    }

    public Resource cargarImagen(String nombre) {
        if (vacio(nombre)) {
            return null;
        }

        if (esAzure(nombre)) {
            return cargarAzure("imagenes", nombre);
        }

        // Mantiene los enlaces anteriores durante la migración.
        if (esUrl(nombre)) {
            return cargarUrl(nombre);
        }

        Resource local = cargarLocal(carpetaImagenes, nombre);

        if (local != null) {
            return local;
        }

        if (!nombre.matches("[a-zA-Z0-9._-]+")) {
            return null;
        }

        Resource recurso = new ClassPathResource(
                "static/imagenes/" + nombre
        );

        return recurso.exists() && recurso.isReadable()
                ? recurso : null;
    }

    public Resource cargarArchivo(String nombre) {
        if (vacio(nombre)) {
            return null;
        }

        if (esAzure(nombre)) {
            return cargarAzure("archivos", nombre);
        }

        if (esUrl(nombre)) {
            return cargarUrl(nombre);
        }

        return cargarLocal(carpetaArchivos, nombre);
    }

    private Resource cargarAzure(String carpeta, String nombre) {
        try {
            byte[] contenido = contenedor
                    .getBlobClient(carpeta + "/" + nombre)
                    .downloadContent()
                    .toBytes();

            return new ByteArrayResource(contenido) {
                @Override
                public String getFilename() {
                    return nombre;
                }
            };

        } catch (BlobStorageException e) {
            if (e.getStatusCode() == 404) {
                return null;
            }

            throw e;
        }
    }

    private Resource cargarUrl(String url) {
        try {
            Resource recurso = new UrlResource(url);

            return recurso.exists() && recurso.isReadable()
                    ? recurso : null;

        } catch (MalformedURLException e) {
            return null;
        }
    }

    private Resource cargarLocal(Path carpeta, String nombre) {
        Path archivo = carpeta.resolve(nombre).normalize();

        if (!archivo.startsWith(carpeta)) {
            return null;
        }

        try {
            Resource recurso = new UrlResource(archivo.toUri());

            return recurso.exists() && recurso.isReadable()
                    ? recurso : null;

        } catch (MalformedURLException e) {
            return null;
        }
    }

    public void eliminarImagen(String nombre) {
        eliminar("imagenes", carpetaImagenes, nombre);
    }

    public void eliminarArchivo(String nombre) {
        eliminar("archivos", carpetaArchivos, nombre);
    }

    private void eliminar(
            String carpetaAzure,
            Path carpetaLocal,
            String nombre) {

        if (vacio(nombre) || esUrl(nombre)) {
            return;
        }

        if (esAzure(nombre)) {
            contenedor.getBlobClient(
                    carpetaAzure + "/" + nombre
            ).deleteIfExists();

            return;
        }

        Path archivo = carpetaLocal.resolve(nombre).normalize();

        if (!archivo.startsWith(carpetaLocal)) {
            return;
        }

        try {
            Files.deleteIfExists(archivo);
        } catch (IOException e) {
            throw new IllegalStateException(
                    "No se pudo eliminar el archivo local", e
            );
        }
    }

    private boolean esAzure(String nombre) {
        return nombre.matches(
                "az-[0-9a-fA-F-]{36}(\\.[a-z0-9]{1,10})?"
        );
    }

    private boolean esUrl(String nombre) {
        return nombre.startsWith("https://")
                || nombre.startsWith("http://");
    }

    private boolean vacio(String nombre) {
        return nombre == null || nombre.isBlank();
    }
}
