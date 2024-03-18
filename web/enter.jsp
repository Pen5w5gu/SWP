<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Excel File</title>
</head>
<body>
    <h2>Upload Excel File</h2>
    <form action="UploadExcelServlet" id="uploadForm" enctype="multipart/form-data" method="post">
    <input type="file" id="file" name="file" accept=".xlsx">
    <br><br>
    <input type="submit" value="Upload">
</form>

</body>
</html>
