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
public class SachVaTacGia {
    private int MaSach;
    private int MaTacGia;

    public SachVaTacGia() {
    }

    public SachVaTacGia(int MaSach, int MaTacGia) {
        this.MaSach = MaSach;
        this.MaTacGia = MaTacGia;
    }

    public int getMaSach() {
        return MaSach;
    }

    public void setMaSach(int MaSach) {
        this.MaSach = MaSach;
    }

    public int getMaTacGia() {
        return MaTacGia;
    }

    public void setMaTacGia(int MaTacGia) {
        this.MaTacGia = MaTacGia;
    }
    
    
}
