package cllockin;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class EmployeeDAO {
	
	
	MongoCollection<Document> collection;
	 
	//mongodb://zohaib3274:halal101@ds155213.mlab.com:55213/gql-library
	//mongodb://clockinTest:shito564@ds135724.mlab.com:35724/clockin
	public  EmployeeDAO(){
		MongoClient mc = new MongoClient(new MongoClientURI("mongodb://clockinTest:shito564@ds135724.mlab.com:35724/clockin"));
		MongoDatabase database = mc.getDatabase("clockin");
		collection = database.getCollection("employees");
	}
	
	public void updateEmployee(EmployeeModel employee) {
		EmployeeModel exsistingEmp = new EmployeeDAO().getEmployee(employee.getEmpid());
		if(!employee.employeeCompare(exsistingEmp)) {
			collection.deleteOne(new Document("_id", exsistingEmp.getEmpid()));
			Document doc = new Document("_id", employee.getEmpid())
					.append("firstname", employee.getFirstName())
	                .append("lastname", employee.getLastName())
	                .append("employeeemail", employee.getEmail())
	                .append("employeepassword", employee.getPassword())
	                .append("employeephone", employee.getPhone())
	                .append("businessid", employee.getId())
	                .append("active", employee.getActive())
	                .append("date", employee.getDate())
	                .append("hourly", employee.getHourlyRate());
			collection.insertOne(doc);
		}
	}
	
	public EmployeeModel getEmployee(int empid) {
		List<Document> documents = (List<Document>) collection.find().into(
				new ArrayList<Document>());
		EmployeeModel emp = new EmployeeModel();
		for(Document document : documents){
			int id = document.getInteger("_id");
			if( id == empid) {
				 emp = new EmployeeModel(document.getString("firstname"),document.getString("lastname"),
						document.getString("employeeemail"),document.getString("employeephone"),
						document.getString("employeepassword"), document.getInteger("businessid"), 
						document.getString("active"),document.getInteger("_id"),document.getString("date"),document.getDouble("hourly"));
				
			}
		}
		return emp;
	}
	
	public ArrayList<EmployeeModel> getAllEmployees(int bussid){
		ArrayList<EmployeeModel> newList = new ArrayList<EmployeeModel>();
		List<Document> documents = (List<Document>) collection.find().into(
				new ArrayList<Document>());
		for(Document document : documents){
			int id = document.getInteger("businessid");
			if( id == bussid) {
				EmployeeModel emp = new EmployeeModel(document.getString("firstname"),document.getString("lastname"),
						document.getString("employeeemail"),document.getString("employeephone"),
						document.getString("employeepassword"), bussid, document.getString("active"),
						document.getInteger("_id"),document.getString("date"),document.getDouble("hourly"));
				newList.add(emp);
			}
		}
		return newList;
	}
	
	public void  insertNewEmployee(EmployeeModel emp) {
		int emp_id = getNextVal();
		emp_id++;
		Document doc = new Document("_id", emp_id)
				.append("firstname", emp.getFirstName())
                .append("lastname", emp.getLastName())
                .append("employeeemail", emp.getEmail())
                .append("employeepassword", emp.getPassword())
                .append("employeephone", emp.getPhone())
                .append("businessid", emp.getId())
                .append("active", "Yes")
                .append("date", emp.getDate())
                .append("hourly", emp.getHourlyRate());
		collection.insertOne(doc);
		
	}
	
	
	
	public int getNextVal() {
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

}
