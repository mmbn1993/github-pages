<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>تطبيق الجدول</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            direction: rtl;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        input {
            padding: 5px;
            width: 200px;
        }
        button {
            padding: 10px 20px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <h1>تطبيق الجدول</h1>

    <form id="dataForm">
        <label for="name">الاسم:</label>
        <input type="text" id="name" required><br><br>

        <label for="phone">رقم الهاتف:</label>
        <input type="text" id="phone" required><br><br>

        <label for="weight">الوزن:</label>
        <input type="text" id="weight" required><br><br>

        <button type="submit">إضافة</button>
    </form>

    <table id="dataTable">
        <thead>
            <tr>
                <th>الاسم</th>
                <th>رقم الهاتف</th>
                <th>الوزن</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

    <script>
        // تحميل البيانات المحفوظة عند تحميل الصفحة
        document.addEventListener('DOMContentLoaded', function() {
            loadData();
        });

        // إضافة بيانات جديدة
        document.getElementById('dataForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const name = document.getElementById('name').value;
            const phone = document.getElementById('phone').value;
            const weight = document.getElementById('weight').value;

            const data = {
                name: name,
                phone: phone,
                weight: weight
            };

            saveData(data);
            addRowToTable(data);
            document.getElementById('dataForm').reset();
        });

        // حفظ البيانات في localStorage
        function saveData(data) {
            let savedData = JSON.parse(localStorage.getItem('tableData')) || [];
            savedData.push(data);
            localStorage.setItem('tableData', JSON.stringify(savedData));
        }

        // تحميل البيانات من localStorage
        function loadData() {
            let savedData = JSON.parse(localStorage.getItem('tableData')) || [];
            savedData.forEach(data => {
                addRowToTable(data);
            });
        }

        // إضافة صف جديد إلى الجدول
        function addRowToTable(data) {
            const tableBody = document.querySelector('#dataTable tbody');
            const newRow = document.createElement('tr');

            newRow.innerHTML = `
                <td>${data.name}</td>
                <td>${data.phone}</td>
                <td>${data.weight}</td>
            `;

            tableBody.appendChild(newRow);
        }
    </script>

</body>
</html>
