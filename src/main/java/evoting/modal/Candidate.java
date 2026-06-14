package evoting.modal;

public class Candidate {
    private int candidateId;
    private String fullName;
    private String partyName;
    private String partyImage;
    private int age;
    private String gender;
    private String mobile;
    private String qualification;
    
    // Constructors
    public Candidate() {}
    
    public Candidate(int candidateId, String fullName, String partyName, 
                    String partyImage, int age, String gender, 
                    String mobile, String qualification) 
    {
        this.candidateId = candidateId;
        this.fullName = fullName;
        this.partyName = partyName;
        this.partyImage = partyImage;
        this.age = age;
        this.gender = gender;
        this.mobile = mobile;
        this.qualification = qualification;
    }
    
    // Getters and Setters
    public int getCandidateId() { return candidateId; }
    public void setCandidateId(int candidateId) { this.candidateId = candidateId; }
    
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    
    public String getPartyName() { return partyName; }
    public void setPartyName(String partyName) { this.partyName = partyName; }
    
    public String getPartyImage() { return partyImage; }
    public void setPartyImage(String partyImage) { this.partyImage = partyImage; }
    
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    
    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }
    
    public String getQualification() { return qualification; }
    public void setQualification(String qualification) { this.qualification = qualification; }
}