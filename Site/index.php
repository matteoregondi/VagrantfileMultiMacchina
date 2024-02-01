<?php
$servername = "10.10.20.11";
$dbname = "DBProva";
$username = "admin";
$password = "Password&1";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $connection_status = "<div class='alert alert-success'>Connected successfully</div>";
} catch(PDOException $e) {
    $connection_status = "<div class='alert alert-danger'>Connection failed: " . $e->getMessage() . "</div>";
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Check Database Connection</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
    <h1>Database Connection Status</h1>
    <?php echo $connection_status; ?>
    <div class="container mt-5">
    <h1 class="text-center mb-5">Employees</h1>
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>ID</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Hire Date</th>
          <th>Department</th>
          <th>Salary</th>
        </tr>
      </thead>
      <tbody>
        <?php
          

          $conn = new mysqli($servername, $username, $password, $dbname);

          if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
          }

          $sql = "SELECT * FROM Employees";
          $result = $conn->query($sql);

          if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
              echo "<tr>";
              echo "<td>" . $row["id"] . "</td>";
              echo "<td>" . $row["first_name"] . "</td>";
              echo "<td>" . $row["last_name"] . "</td>";
              echo "<td>" . $row["email"] . "</td>";
              echo "<td>" . $row["phone"] . "</td>";
              echo "<td>" . $row["hire_date"] . "</td>";
              echo "<td>" . $row["department"] . "</td>";
              echo "<td>" . $row["salary"] . "</td>";
              echo "</tr>";
            }
          } else {
            echo "<tr><td colspan='8'>No records found</td></tr>";
          }

          $conn->close();
        ?>
      </tbody>
    </table>
  </div>
</body>
</html>