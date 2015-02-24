##Core Data is not a Database
When we talk about persistent data, people probably think of database. If you are familiar with Oracle or MySQL, you know that relational database stores data in the form of table, row and column, and it usually facilitates access through what-so-called SQL query. However, don’t mix up Core Data with database. Though SQLite database is the default persistent store for Core Data on iPhone, Core Data is not a relational database. It is actually a framework that lets developers store (or retrieve) data in database in an object-oriented way. With Core Data, you can easily map the objects in your apps to the table records in the database without even knowing any SQL.

###Managed Object Model 
It describes the schema that you use in the app. If you have a database background, think of this as the database schema. However, the schema is represented by a collection of objects (also known as entities). In Xcode, the Managed Object Model is defined in a file with the extension .xcdatamodeld. You can use the visual editor to define the entities and their attributes, as well as, relationships.

###Persistent Store Coordinator 
SQLite is the default persistent store in iOS. However, Core Data allows developers to setup multiple stores containing different entities. The Persistent Store Coordinator is the party responsible to manage different persistent object stores and save the objects to the stores. Forget about it you don’t understand what it is. You’ll not interact with Persistent Store Coordinator directly when using Core Data.

###Managed Object Context 
Think of it as a “scratch pad” containing objects that interacts with data in persistent store. Its job is to manage objects created and returned using Core Data. Among the components in the Core Data Stack, the Managed Object Context is the one you’ll work with for most of the time. In general, whenever you need to fetch and save objects in persistent store, the context is the first component you’ll talk to.


<div id="container" align="middle">
    <img src="http://www.appcoda.com/wp-content/uploads/2012/12/Core-Data-Stack.jpg" alt="Drawing" style="width: 200px;" />
</div>