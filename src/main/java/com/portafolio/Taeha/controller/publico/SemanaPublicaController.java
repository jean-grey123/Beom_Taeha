package com.portafolio.Taeha.controller.publico;

import com.portafolio.Taeha.model.Semana;
import com.portafolio.Taeha.repository.SemanaRepository;
import com.portafolio.Taeha.repository.TrabajoRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/semana")
public class SemanaPublicaController {

    private final SemanaRepository semanaRepository;
    private final TrabajoRepository trabajoRepository;

    public SemanaPublicaController(
            SemanaRepository semanaRepository,
            TrabajoRepository trabajoRepository) {

        this.semanaRepository = semanaRepository;
        this.trabajoRepository = trabajoRepository;
    }

    @GetMapping("/{id}")
    public String verSemana(
            @PathVariable Long id,
            Model model) {

        Semana semana = semanaRepository.findById(id)
                .orElseThrow(() ->
                        new IllegalArgumentException(
                                "Semana no encontrada: " + id
                        )
                );

        model.addAttribute("semana", semana);

        model.addAttribute(
                "trabajos",
                trabajoRepository.findBySemanaId(id)
        );

        return "publico/semana";
    }
}