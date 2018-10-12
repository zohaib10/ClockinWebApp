package cllockin;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class BusinessDAO {
	
	MongoDatabase database;
	 
	
	public BusinessDAO() {
		MongoClient mc = new MongoClient(new MongoClientURI("mongodb://localhost:27017"));
		database = mc.getDatabase("clockin");
	}
	

	public int getbusinessid(String email, String password) {
		MongoCollection<Document> collection = database.getCollection("businesses");
		int id = 0;
		List<Document> documents = (List<Document>) collection.find().into(
				new ArrayList<Document>());
		for(Document document : documents){
			if(document.get("accountemail").toString().toLowerCase().equals(email.toLowerCase()) 
					&& document.get("accountpassword").toString().toLowerCase().equals(password.toLowerCase())) {
				id = document.getInteger("_id");
				break;
			}
		}
		return id;
	}
	
	public boolean isUserValid(String email, String password){
		MongoCollection<Document> collection = database.getCollection("businesses");
		boolean found = false;
		List<Document> documents = (List<Document>) collection.find().into(
				new ArrayList<Document>());
		for(Document document : documents){
			if(document.get("accountemail").toString().toLowerCase().equals(email.toLowerCase()) 
					&& document.get("accountpassword").toString().toLowerCase().equals(password.toLowerCase())) {
				found = true;
				break;
			}
		}
		return found;
	}
	
	public BusinessModel getBusinessDetails(int bussid) {
		MongoCollection<Document> collection = database.getCollection("businesses");
		Document myDoc = new Document();
		List<Document> documents = (List<Document>) collection.find().into(
				new ArrayList<Document>());
		for(Document document : documents){
			int id = document.getInteger("_id");
			if( id == bussid) {
				myDoc = document;
			}
		}
		BusinessModel businesss = new BusinessModel();
		businesss.setAccountEmail(myDoc.getString("accountemail"));
		businesss.setAccountpassword(myDoc.getString("accountpassword"));
		businesss.setBusinessName(myDoc.getString("businessname"));
		businesss.setBusinessPhone(myDoc.getString("businessphone"));
		businesss.setDefaultPaymentPeriod(myDoc.getString("defaultpaymentperiod"));
		businesss.setFirstName(myDoc.getString("firstname"));
		businesss.setLastName(myDoc.getString("lastname"));
		businesss.setAccountType(myDoc.getString("accounttype"));
		return businesss;
	}
	
	public int insertNewRecord(BusinessModel newBusiness) {
		MongoCollection<Document> collection = database.getCollection("businesses");
		int id = getNextVal();
		id++;
		Document doc = new Document("_id", id)
				.append("firstname", newBusiness.getFirstName())
                .append("lastname", newBusiness.getLastName())
                .append("accountemail", newBusiness.getAccountEmail())
                .append("accountpassword", newBusiness.getAccountpassword())
                .append("businessname", newBusiness.getBusinessName())
                .append("businessphone", newBusiness.getBusinessPhone())
                .append("defaultpaymentperiod", newBusiness.getDefaultPaymentPeriod())
                .append("accounttype", newBusiness.getAccountType());
		collection.insertOne(doc);
		return 0;
	}
	
	public int getNextVal() {
		MongoCollection<Document> collection = database.getCollection("businesses");
		List<Document> documents = (List<Document>) collection.find().into(
				new ArrayList<Document>());
		int nextId = 0;
		for(Document document : documents){
			int id = document.getInteger("_id");
			if(id > nextId) {
				nextId = id;
			}
		}
		return nextId;
	}
	
	public String getPasswordWithEmail(String email) {
		MongoCollection<Document> collection = database.getCollection("businesses");
		List<Document> documents = (List<Document>) collection.find().into(
				new ArrayList<Document>());
		for(Document document : documents){
			String aemail = document.getString("accountemail");
			if(email.equalsIgnoreCase(aemail)) {
				return document.getString("accountpassword");
			}
		}
		return "GhakrayAriBan";
	}
	
	public boolean doesAccountExist(String email) {
		MongoCollection<Document> collection = database.getCollection("businesses");
		List<Document> documents = (List<Document>) collection.find().into(
				new ArrayList<Document>());
		for(Document document : documents){
			String aemail = document.getString("accountemail");
			if(email.equalsIgnoreCase(aemail)) {
				return true;
			}
		}
		return false;
	}
	public boolean isValidAdmin(String pass, int id) {
		MongoCollection<Document> collection = database.getCollection("businesses");
		List<Document> documents = (List<Document>) collection.find().into(
				new ArrayList<Document>());
		for(Document document : documents){
			if(id == document.getInteger("_id") && pass.equals(document.getString("accountpassword"))) {
				return true;
			}
		}
		return false;
	}
	
}

//1) Search the records using conditionals for both methods



//
//MongoClient client= new MongoClient();
//MongoDatabase db = client.getDatabase("dbname");
//MongoCollection col = db.getCollection("dbcollection");
//
//List<String> topics = new ArrayList<String>();
//topics.add("Business");
//topics.add("Technology");
//topics.add("Sports");
//topics.add("Career");
//
//col.findOneAndUpdate(Filters.eq("_id", new ObjectId("58b1404d002d2b1a481b8ddf")), Updates.pushEach("readAbout", topics));
