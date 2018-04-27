# MI-AFP homework #09

 Homework to create simple *Personal Finance Log*
 
## Task 

This time the task is up to you from scratch so you will learn how to make web app projects without any big limitations, strict tests, and given code. You are free to use any web framework you want! There are only few technical things you must follow and the topic:

1. The topic is **Personal Finance Log** = your application must be able to create, retrive, update, delete, and list records of personal budget change (incomes and expenses). Each record consists at least of unique id, timestamp, and amount of money.
2. Database must be used to store the data, allowed types are: postgresql, mysql, and sqlite (preffered). It is up to you what librabry you want to use.
3. There should be basic templates using `blaze-html` (one static and two dynamic pages). Visual side is not graded but it is good practice to use some CSS framework...

Routes:

* `GET /` = list with total (sum, most recent on top) and simple form for new record, in list is possible to delete record by clicking a button
* `POST /finance` = create new record (then redirect to list)
* `DELETE /finance/<id>` = update existing record (then redirect to  list)

Optionally, you can test and document your application!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE)
file for more details.
