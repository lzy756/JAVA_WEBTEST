import java.util.*;
import java.io.*;
import Util.User;

public class Main {
    public static void main(String[] args) {
        User user = new User();
        user.setName("calc");
        user.setPassword("test");
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ObjectOutputStream out = new ObjectOutputStream(baos);
            out.writeObject(user);
            out.close();
            System.out.println(Base64.getEncoder().encodeToString(baos.toByteArray()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
