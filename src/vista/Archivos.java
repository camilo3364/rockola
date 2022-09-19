/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import java.io.File;

/**
 *
 * @author camij
 */
public class Archivos {
    private String filename;
    private File myFile;

    Archivos(String filename, File myFile) {
        
        this.filename = filename;
        this.myFile = myFile;
        
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public File getMyFile() {
        return myFile;
    }

    public void setMyFile(File myFile) {
        this.myFile = myFile;
    }
    

    
}
