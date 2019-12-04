/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelAdmin;

/**
 *
 * @author Auriat
 */
public class NgonNgu {
    private String MaNgonNgu;
    private String TenNgonNgu;

    public NgonNgu() {
    }

    public NgonNgu(String MaNgonNgu, String TenNgonNgu) {
        this.MaNgonNgu = MaNgonNgu;
        this.TenNgonNgu = TenNgonNgu;
    }

    public String getMaNgonNgu() {
        return MaNgonNgu;
    }

    public void setMaNgonNgu(String MaNgonNgu) {
        this.MaNgonNgu = MaNgonNgu;
    }

    public String getTenNgonNgu() {
        return TenNgonNgu;
    }

    public void setTenNgonNgu(String TenNgonNgu) {
        this.TenNgonNgu = TenNgonNgu;
    }
    
    
}
