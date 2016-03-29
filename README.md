# Schema Design: One-to-one Schema 
 
##Learning Competencies 

* Design database schema from problem data
* Model relationships in a relational database (one-to-one, one-to-many, many-to-many)


##Summary 

 One-to-one relationships are easy to understand, but it's hard to see when to use one.  We recommend that you solve the one-to-many challenge first, before moving into
the one-to-one relationships.

An example of a one-to-one relationship is my connection to my liver.  I have a liver, and my liver belongs only to me.  We'll ignore the world of conjoined twins, for now.

A more practical example might be a site that optionally lets a user connect their Facebook account.  It might look like this:

<pre>
+---------------------+        +-------------------+
| users               |        | facebook_accounts |
+---------------------+        +-------------------+
| id                  |     /-&gt;| id                |
| first_name          |    /   | fb_username       |
| last_name           |   /    | created_at        |
| email               |  /     | updated_at        |
| facebook_account_id |-/      +-------------------+
| created_at          |
| updated_at          |
+---------------------+
</pre>

The <code>facebook&#95;account&#95;id</code> field might be <code>NULL</code>, which is a special value that signifies "nothing."  In this case, a <code>NULL</code> value in the <code>facebook&#95;account&#95;id</code> column means "this user hasn't connected their Facebook account."

You can see from the way this is designed, a user can have at most one Facebook account, and the <code>facebook&#95;accounts</code>table doesn't reference the <code>user</code> table at all.  This would be an example of a one-to-one relationship.

Of course, you could move all the fields in the <code>facebook&#95;accounts</code> table directly into the <code>user</code> table.
This is true of any one-to-one relationship, which is why it's hard to see when to use one.
The rule of thumb is this: if you have a logical grouping of fields which can all optionally be <code>NULL</code>,
it's a good idea to split those fields out into a separate table in a one-to-one relationship.


##Releases

###Release 0 : Design the schema

Use [SQL Designer](https://socrates.devbootcamp.com/sql.html) to create your schema.  Model the relationship between the <code>users</code> and <code>facebook&#95;accounts</code>.

When you are done, take a screenshot of your schema, commit it, and issue a pull request.

##Resources

* [SQL Designer](https://socrates.devbootcamp.com/sql.html)
