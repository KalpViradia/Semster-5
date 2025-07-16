import java.io.*;
import java.net.*;

public class TCPServer {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(3000);
        System.out.println("Server is running.");

        Socket clienSocket = serverSocket.accept();
        System.out.println("Client Connected.");

        BufferedReader in = new BufferedReader(new InputStreamReader(clienSocket.getInputStream()));
        PrintWriter out = new PrintWriter(clienSocket.getOutputStream(), true);

        String message = in.readLine();
        System.out.println("Client Says: " + message);

        out.println("Message recieved by the server.");

        clienSocket.close();
        serverSocket.close();
    }
}
