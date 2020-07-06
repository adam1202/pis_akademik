<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    Cetak Siswa Berdasarkan Id
<table border="1">
<thead>
    <tr>
        <th>no</th>
        <th>NISN</th>
        <th>NILAI</th>
        <th>Kode Mapel</th>
        <th>Pilihan</th>
    </tr>
</thead>
<tbody>
 
<?php $no=1; foreach($record->result() as $row){ ?>
    <tr>
        <td><?php echo $no++; ?></td>
        <td><?php echo $row->nisn ?></td>
        <td><?php echo $row->nilai ?></td>
        <td><?php echo $row->kd_mapel ?></td>
        <td><a href="<?php echo base_url().'cetak/cetak_id/'.$row->nisn;?>"><button>cetak</button></a> </td>
    </tr>
<?php } ?>
</tbody>
</table>
<br>
</body>
</html>
