<!DOCTYPE html>
<html>
<head>
    <title>Report Siswa</title>
</head>
<body>


    <center>
        <h1>DATA SISWA/SISWI SDN 35 TEGINENENG COY</h1>

    <table border="1">
        <thead>
                <tr>
                    <th>NO</th>
                    <th>FOTO</th>
                    <th>NISN</th>
                    <th>NAMA</th>
                    <th>JENIS KELAMIN</th>
                    <th>TANGGAL LAHIR</th>
                    <th>TEMPAT LAHIR</th>
                    <th>Agama</th>
                    <th>Kelas</th>
                </tr>            
        </thead>
        <tbody>
            <?php $no = 1; foreach ($get_data->result() as $d) {?>
            <tr>
                <td><?= $no;?></td>
                <td>
                    <img width="50" height="50" src="<?= base_url('uploads/').$d->foto;?>">
                </td>
                <td><?= $d->nisn; ?></td>
                <td><?= $d->nama; ?></td>
                <td><?= $d->jenis_kelamin; ?></td>
                <td><?= $d->tanggal_lahir; ?></td>
                <td><?= $d->tempat_lahir; ?></td>
                <td><?= $d->nama_agama; ?></td>
                <td><?= $d->nama_kelas; ?></td>
            </tr>
            <?php $no++;} ?>
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