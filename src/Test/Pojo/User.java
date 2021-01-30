package Test.Pojo;

public class User {
    private int id;
    private String number;
    private String name;
    private String password;
    private String personnumber;
    private String email;
    private String tellnumber;

    public User( String number, String name, String password, String personnumber, String email, String tellnumber) {
        this.number = number;
        this.name = name;
        this.password = password;
        this.personnumber = personnumber;
        this.email = email;
        this.tellnumber = tellnumber;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPersonnumber() {
        return personnumber;
    }

    public void setPersonnumber(String personnumber) {
        this.personnumber = personnumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTellnumber() {
        return tellnumber;
    }

    public void setTellnumber(String tellnumber) {
        this.tellnumber = tellnumber;
    }
}
