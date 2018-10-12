package cllockin;


import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class MongoConnection {
	
	public List<Document> getCollection() {
		MongoClient mc = new MongoClient(new MongoClientURI("mongodb://localhost:27017"));
		MongoDatabase database = mc.getDatabase("records");
		MongoCollection<Document> collection = database.getCollection("students");
		System.out.println("Got Connection..............");
		//mc.close();
		
		List<Document> documents = (List<Document>) collection.find().into(
				new ArrayList<Document>());
		System.out.println(documents.size());
		
		return documents;
	}
}


//List<Document> documents = (List<Document>) collection.find().into(
//		new ArrayList<Document>());
//
//for(Document document : documents){
//	int id = document.getInteger("_id");
//    System.out.println(id);
//}

