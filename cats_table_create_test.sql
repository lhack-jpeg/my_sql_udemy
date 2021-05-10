USE unique_cats
create TABLE cats
    (
        cat_id INT NOT NULL auto_increment,
        name VARCHAR(100),
        age INT,
        PRIMARY KEY(cat_id)
	);