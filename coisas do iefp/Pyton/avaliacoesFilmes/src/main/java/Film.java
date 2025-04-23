
public class Film {
    private String title;
    private String release_date;
    private String vote_average;

    public Film( String title, String release_date, String vote_average){
        this.title = title;
        this.release_date = release_date;
        this.vote_average = vote_average;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRelease_date(){
        return release_date;
    }

    public void setRelease_date(String release_date) {
        this.release_date = release_date;
    }

    public String getVote_average(){
        return vote_average;
    }

    public void setVote_average(String vote_average) {
        this.vote_average = vote_average;
    }
}
