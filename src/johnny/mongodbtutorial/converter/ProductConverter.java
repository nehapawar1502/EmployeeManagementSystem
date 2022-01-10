package johnny.mongodbtutorial.converter;

import org.bson.Document;
import org.bson.types.ObjectId;

import johnny.mongodbtutorial.model.Product;

public class ProductConverter {

    // convert Product Object to MongoDB Document
    // take special note of converting id String to ObjectId
    public static Document toDocument(Product p) {
        Document doc = new Document("name", p.getName()).append("mob", p.getMob()).append("add", p.getAdd()).append("dob", p.getDob()).append("sal", p.getSal());
        if (p.getId() != null) {
            doc.append("_id", new ObjectId(p.getId()));
        }
        return doc;
    }

    // convert MongoDB Document to Product
    // take special note of converting ObjectId to String
    public static Product toProduct(Document doc) {
        Product p = new Product();
        p.setName((String) doc.get("name"));
        p.setMob((String) doc.get("mob"));
        p.setAdd((String) doc.get("add"));
        p.setDob((String) doc.get("dob"));
        p.setSal((String) doc.get("sal"));
        p.setId(((ObjectId) doc.get("_id")).toString());
        return p;
    }

}