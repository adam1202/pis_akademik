<!DOCTYPE html>
<html>
<head>
    <title>Report Siswa</title>
</head>
<body>



    <center>
        <h1>DAFTAR GURU SDN 35 TEGINENENG</h1>

    <table border="1">
        <thead>
                <tr>
                    <th>NO</th>
                    <th>NIP</th>
                    <th>NAMA GURU</th>
                    <th>JENIS KELAMIN</th>
                </tr>            
        </thead>
        <tbody>
            <?php $no = 1; foreach ($get_data->result() as $d) {?>
            <tr>
                <td><?= $no;?></td>
                <td><?= $d->nip; ?></td>
                <td><?= $d->nama_guru; ?></td>
                <td><?= $d->jenis_kelamin; ?></td>
            </tr>
            <?php $no++; } ?>
        </tbody>
    </table>
    </center>
</body>
</html>

<script type="text/javascript">
if(navigator.userAgent.toLowerCase().indexOf('chrome') > -1){   // Chrome Browser Detected?
    window.PPClose = false;                                     // Clear Close Flag
    window.onbeforeunload = function(){                         // Before Window Close Event
        if(window.PPClose === false){                           // Close not OK?
            return 'Leaving this page will block the parent window!\nPlease select "Stay on this Page option" and use the\nCancel button instead to close the Print Preview Window.\n';
        }
    }                   
    window.print();                                             // Print preview
    window.PPClose = true;                                      // Set Close Flag to OK.
}
</script>