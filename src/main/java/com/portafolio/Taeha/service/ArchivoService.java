package com.portafolio.Taeha.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Map;
import java.util.UUID;

@Service
public class ArchivoService {

    private final Path carpetaImagenes;
    private final Path carpetaArchivos;

    private final Cloudinary cloudinary;

    public ArchivoService(Cloudinary cloudinary) {

        this.cloudinary = cloudinary;

        this.carpetaImagenes =
                Paths.get("uploads", "imagenes")
                        .toAbsolutePath()
                        .normalize();

        this.carpetaArchivos =
                Paths.get("uploads", "archivos")
                        .toAbsolutePath()
                        .normalize();

        try {

            Files.createDirectories(carpetaImagenes);
            Files.createDirectories(carpetaArchivos);

        } catch (IOException e) {

            throw new RuntimeException(
                    "No se pudieron crear las carpetas de archivos",
                    e
            );
        }
    }

    // =========================================================
    // GUARDAR IMAGEN EN CLOUDINARY
    // =========================================================

    public String guardarImagen(MultipartFile archivo) {

        if (archivo == null || archivo.isEmpty()) {
            return null;
        }

        try {

            Map resultado =
                    cloudinary.uploader().upload(
                            archivo.getBytes(),
                            ObjectUtils.asMap(
                                    "resource_type", "image",
                                    "folder", "taeha/imagenes"
                            )
                    );

            String url =
                    (String) resultado.get("secure_url");

            System.out.println("======================================");
            System.out.println("IMAGEN SUBIDA A CLOUDINARY");
            System.out.println("URL: " + url);
            System.out.println("======================================");

            return url;

        } catch (IOException e) {

            throw new RuntimeException(
                    "Error al subir la imagen a Cloudinary",
                    e
            );
        }
    }

    // =========================================================
    // GUARDAR ARCHIVOS NORMALES
    // =========================================================

    public String guardarArchivo(MultipartFile archivo) {

        return guardarArchivoLocal(
                archivo,
                carpetaArchivos
        );
    }

    private String guardarArchivoLocal(
            MultipartFile archivo,
            Path carpeta) {

        if (archivo == null || archivo.isEmpty()) {
            return null;
        }

        try {

            String nombreOriginal =
                    archivo.getOriginalFilename();

            if (nombreOriginal == null
                    || nombreOriginal.isBlank()) {

                throw new RuntimeException(
                        "El archivo no tiene nombre"
                );
            }

            String extension = "";

            int punto =
                    nombreOriginal.lastIndexOf(".");

            if (punto >= 0) {

                extension =
                        nombreOriginal
                                .substring(punto)
                                .toLowerCase();
            }

            String nombreNuevo =
                    UUID.randomUUID() + extension;

            Path destino =
                    carpeta
                            .resolve(nombreNuevo)
                            .normalize();

            if (!destino.startsWith(carpeta)) {

                throw new RuntimeException(
                        "Ruta de archivo no válida"
                );
            }

            Files.copy(
                    archivo.getInputStream(),
                    destino,
                    StandardCopyOption.REPLACE_EXISTING
            );

            return nombreNuevo;

        } catch (IOException e) {

            throw new RuntimeException(
                    "Error al guardar el archivo",
                    e
            );
        }
    }

    // =========================================================
    // CARGAR IMAGEN
    // =========================================================

    public Resource cargarImagen(String nombre) {

        if (nombre == null || nombre.isBlank()) {
            return null;
        }

        // Si ya es una URL de Cloudinary
        if (nombre.startsWith("http://")
                || nombre.startsWith("https://")) {

            try {

                Resource recurso =
                        new UrlResource(nombre);

                if (recurso.exists()
                        && recurso.isReadable()) {

                    return recurso;
                }

            } catch (MalformedURLException e) {

                return null;
            }

            return null;
        }

        // Compatibilidad con imágenes antiguas
        // que todavía estén guardadas localmente.

        Resource recurso =
                cargar(
                        carpetaImagenes,
                        nombre
                );

        if (recurso != null) {
            return recurso;
        }

        // Buscar también en static/imagenes

        try {

            Resource recursoStatic =
                    new org.springframework.core.io.ClassPathResource(
                            "static/imagenes/" + nombre
                    );

            if (recursoStatic.exists()
                    && recursoStatic.isReadable()) {

                return recursoStatic;
            }

        } catch (Exception e) {

            return null;
        }

        return null;
    }

    // =========================================================
    // CARGAR ARCHIVO
    // =========================================================

    public Resource cargarArchivo(String nombre) {

        return cargar(
                carpetaArchivos,
                nombre
        );
    }

    // =========================================================
    // CARGAR ARCHIVO LOCAL
    // =========================================================

    private Resource cargar(
            Path carpeta,
            String nombre) {

        try {

            Path archivo =
                    carpeta
                            .resolve(nombre)
                            .normalize();

            if (!archivo.startsWith(carpeta)) {
                return null;
            }

            Resource resource =
                    new UrlResource(
                            archivo.toUri()
                    );

            if (resource.exists()
                    && resource.isReadable()) {

                return resource;
            }

            return null;

        } catch (MalformedURLException e) {

            return null;
        }
    }

    // =========================================================
    // ELIMINAR IMAGEN
    // =========================================================

    public void eliminarImagen(String nombre) {

        // Las imágenes de Cloudinary no se eliminan
        // físicamente por ahora.
        //
        // Esto evita borrar accidentalmente imágenes
        // que todavía pueden estar siendo utilizadas.

        if (nombre == null || nombre.isBlank()) {
            return;
        }

        if (nombre.startsWith("http://")
                || nombre.startsWith("https://")) {

            System.out.println(
                    "Imagen anterior en Cloudinary: "
                            + nombre
            );

            return;
        }

        // Compatibilidad con imágenes antiguas locales.

        eliminar(
                carpetaImagenes,
                nombre
        );
    }

    // =========================================================
    // ELIMINAR ARCHIVO
    // =========================================================

    public void eliminarArchivo(String nombre) {

        eliminar(
                carpetaArchivos,
                nombre
        );
    }

    // =========================================================
    // ELIMINAR ARCHIVO LOCAL
    // =========================================================

    private void eliminar(
            Path carpeta,
            String nombre) {

        if (nombre == null
                || nombre.isBlank()) {

            return;
        }

        try {

            Path archivo =
                    carpeta
                            .resolve(nombre)
                            .normalize();

            if (!archivo.startsWith(carpeta)) {
                return;
            }

            Files.deleteIfExists(archivo);

        } catch (IOException e) {

            throw new RuntimeException(
                    "No se pudo eliminar el archivo: "
                            + nombre,
                    e
            );
        }
    }
}