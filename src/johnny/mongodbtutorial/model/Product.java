package johnny.mongodbtutorial.model;

public class Product {
    private String id;
    private String name;
    private String mob;
    private String add;
    private String dob;

    private String sal;
    
    private double price;

    public Product() {}

    public Product(String id, String name,String mob,String add,String dob) 
    {
        this.id = id;
        this.name = name;
        this.mob = mob;
        this.add = add;
        this.dob = dob;
        this.sal = sal;
       
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getMob() {
        return mob;
    }

    public void setMob(String mob) {
        this.mob = mob;
    }
    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }
    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
    public String getSal() {
        return sal;
    }

    public void setSal(String sal) {
        this.sal = sal;
    }

   
}
