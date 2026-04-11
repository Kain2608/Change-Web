package com.sportpj.sportpj.Model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "shoes")
public class ShoesModel extends ProductModel {
    
    private String target;

    @OneToMany(mappedBy = "shoe", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ShoeVariantModel> variants;

    public String getTarget() { return target; }
    public void setTarget(String target) { this.target = target; }
    public List<ShoeVariantModel> getVariants() { return variants; }
    public void setVariants(List<ShoeVariantModel> variants) { this.variants = variants; }
}