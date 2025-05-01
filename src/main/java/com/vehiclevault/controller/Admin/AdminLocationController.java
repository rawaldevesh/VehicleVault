package com.vehiclevault.controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vehiclevault.entity.AreaEntity;
import com.vehiclevault.entity.CityEntity;
import com.vehiclevault.entity.StateEntity;
import com.vehiclevault.repository.AreaRepository;
import com.vehiclevault.repository.CityRepository;
import com.vehiclevault.repository.StateRepository;

@Controller
public class AdminLocationController {

    @Autowired StateRepository repositoryState;
    @Autowired CityRepository repositoryCity;
    @Autowired AreaRepository repositoryArea;

    @GetMapping("adminaddlocation")
    public String addLocationPage(Model model) {
        model.addAttribute("allState", repositoryState.findAll());
        model.addAttribute("allCity", repositoryCity.findAll());
        return "admin/admin_save_location";
    }

    @PostMapping("adminsavestate")
    public String saveState(StateEntity stateEntity) {
        repositoryState.save(stateEntity);
        return "redirect:/adminaddlocation";
    }

    @PostMapping("adminsavecity")
    public String saveCity(CityEntity city) {
        StateEntity state = repositoryState.findById(city.getStateId()).orElse(null);
        if (state != null) {
            city.setStateName(state.getStateName());
        }
        repositoryCity.save(city);
        return "redirect:/adminaddlocation";
    }

    @PostMapping("adminsavearea")
    public String saveArea(AreaEntity area) {
        StateEntity state = repositoryState.findById(area.getStateId()).orElse(null);
        CityEntity city = repositoryCity.findById(area.getCityId()).orElse(null);

        if (state != null && city != null) {
            area.setCityId(city.getCityId());
            area.setStateId(state.getStateId());
            area.setCityName(city.getCityName());
            area.setStateName(state.getStateName()); // previously using city.getStateName()
        }

        repositoryArea.save(area);
        return "redirect:/adminaddlocation";
    }

    
    @GetMapping("admindeletelocation")
    public String deleteLocation(@RequestParam("id") Integer areaId) {
        repositoryArea.deleteById(areaId);
        return "admin/admin_add_data";
    }


}

