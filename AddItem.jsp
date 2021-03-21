<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Details</title>
        <link href="css/AddItem.css" rel="stylesheet">
    </head>
    <body>
        <form action="AddItems" method="post" enctype="multipart/form-data" class="form">
            <table class="table">
                <caption>Add Item</caption>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <input type="text" name="name" placeholder="Cycle" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        Price
                    </td>
                    <td>
                        <input type="text" name="price" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        Category
                    </td>
                    <td>
                        <input type="text" name="category" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        Description
                    </td>
                    <td>
                        <input type="text" name="description" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        Add Photo
                    </td>
                    <td>
                        <input type="file" name="img" required>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <button>Submit</button>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
