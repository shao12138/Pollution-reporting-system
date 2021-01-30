package Test.Pojo;

public class Pic {
    private int id;
    private String number;
    private String lat;
    private String log;
    private String url;

    public Pic() {
    }

    public Pic(int id, String lat, String log, String url) {
        this.id = id;
        this.lat = lat;
        this.log = log;
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLog() {
        return log;
    }

    public void setLog(String log) {
        this.log = log;
    }
}
