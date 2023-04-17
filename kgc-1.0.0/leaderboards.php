<!DOCTYPE html>
<html>
<head>
	<title>Sanitation League Table</title>
	<style>
		table {
			border-collapse: collapse;
			width: 100%;
			margin: 20px 0;
			font-size: 1em;
			min-width: 400px;
			border-radius: 5px 5px 0 0;
			overflow: hidden;
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
		}

		table thead tr {
			background-color: #009879;
			color: #ffffff;
			text-align: left;
		}

		table th,
		table td {
			padding: 12px 15px;
		}

		table tbody tr {
			border-bottom: 1px solid #dddddd;
		}

		table tbody tr:nth-of-type(even) {
			background-color: #f3f3f3;
		}

		table tbody tr:last-of-type {
			border-bottom: 2px solid #009879;
		}

		h1 {
			text-align: center;
			margin-top: 50px;
			font-size: 2em;
			color: #009879;
		}
	</style>
</head>
<body>
	<h1>Sanitation League Table</h1>
	<table>
		<thead>
			<tr>
				<th>Rank</th>
				<th>Username</th>
				<th>Distance Covered</th>
				<th>Trash Disposed</th>
			</tr>
		</thead>
		<tbody>
			<?php
			// Connect to the MySQL database
			$conn = mysqli_connect("localhost", "root", "", "sanitationGH");

			// Check if the connection was successful
			if (!$conn) {
			    die("Connection failed: " . mysqli_connect_error());
			}

			// Retrieve the sanitation data from the database
			$sql = "SELECT username, distance_covered, trash_disposed FROM sanitation_data ORDER BY distance_covered DESC";
			$result = mysqli_query($conn, $sql);

			// Display the sanitation data in the table
			$rank = 1;
			while ($row = mysqli_fetch_assoc($result)) {
			    echo "<tr>";
			    echo "<td>" . $rank . "</td>";
			    echo "<td>" . $row['username'] . "</td>";
			    echo "<td>" . $row['distance_covered'] . " km</td>";
			    echo "<td>" . $row['trash_disposed'] . " bags</td>";
			    echo "</tr>";
			    $rank++;
			}

			// Close the database connection
			mysqli_close($conn);
			?>
		</tbody>
	</table>
</body>
</html>
