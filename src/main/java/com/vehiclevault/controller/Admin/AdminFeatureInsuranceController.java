package com.vehiclevault.controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vehiclevault.entity.FeaturesEntity;
import com.vehiclevault.entity.InsuranceEntity;
import com.vehiclevault.repository.AreaRepository;
import com.vehiclevault.repository.FeaturesRepository;
import com.vehiclevault.repository.InsuranceRepository;

@Controller
public class AdminFeatureInsuranceController {

    @Autowired InsuranceRepository repositoryInsurance;
    @Autowired FeaturesRepository repositoryFeatures;
    @Autowired AreaRepository repositoryArea;

    @GetMapping("adminadddata")
    public String addDataPage(Model model) {
        model.addAttribute("allArea", repositoryArea.findAll());
        model.addAttribute("allInsurance", repositoryInsurance.findAll());
        model.addAttribute("allFeatures", repositoryFeatures.findAll());
        return "admin/admin_add_data";
    }

    @GetMapping("adminnewinsurance")
    public String newInsurance() {
        return "admin/adminNewInsurance";
    }

    @PostMapping("adminsaveinsurance")
    public String saveInsurance(InsuranceEntity insuranceEntity) {
        repositoryInsurance.save(insuranceEntity);
        return "redirect:/adminadddata";
    }

    @GetMapping("adminnewfeatures")
    public String newFeatures() {
        return "admin/adminNewFeatures";
    }

    @PostMapping("adminsavefeatures")
    public String saveFeature(FeaturesEntity featuresEntity) {
        repositoryFeatures.save(featuresEntity);
        return "redirect:/adminadddata";
    }
    
    @GetMapping("admindeleteinsurance")
    public String deleteInsurance(@RequestParam("id") Integer id) {
        repositoryInsurance.deleteById(id);
        return "redirect:/adminadddata";
    }

    @GetMapping("admindeletefeature")
    public String deleteFeature(@RequestParam("id") Integer id) {
        repositoryFeatures.deleteById(id);
        return "redirect:/adminadddata";
    }

}
