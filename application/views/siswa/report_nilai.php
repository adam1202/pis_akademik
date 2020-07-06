<?php

// $namanya = $_GET['nama'];
$nisn = $_GET['nisn'];
// var_dump($namanya);
// var_dump($nisn);
// $nisn   = $this->uri->segment(3);
// $query = "SELECT ts.nama, tm.kd_mapel, tn.nisn

//         FROM tbl_nilai AS tn, tbl_siswa AS ts, tbl_mapel AS tm
//         WHERE tn.kd_mapel = tm.kd_mapel AND tn.nisn = ts.nisn AND tn.nisn = '$nisn'";
// $sql = $this->db->query($query)->row_array();
var_dump($nisn);

?>

<!DOCTYPE html>
<html>
<head>
	<title>Report Nilai Siswa</title>
</head>
<body>
    <center>
        <!-- <h1>DATA NILAI SISWA : <?=$namanya;?></h1> -->


    <table border="1">

        <thead>
                <tr>
                    <th>NO</th>
                    <th>NISN</th>
                    <th>MAPEL</th>
                    <th>NILAI</th>
                    <th>Nilai Mutu</th>
                </tr>            
        </thead>
        <tbody>
        	<?php $no = 1; foreach ($get_data->result() as $d) {

                            if($d->nilai > 90){
                                $Keterangan = '<p class="text-black">A</p>';
                            }elseif($d->nilai > 80 and $d->nilai <= 90){
                                $Keterangan = '<p class="text-black">B</p>';
                            }elseif($d->nilai > 70 and $d->nilai <= 80){
                                $Keterangan = '<p class="text-black">C</p>';
                            }else{
                                $Keterangan = '<p class="text-black">D</p>';
                            } ?>
        	<tr>
        		<td><?= $no;?></td>
                <td><?= $d->nisn; ?></td>
        		<td><?= $d->nama_mapel; ?></td>
        		<td><?= $d->nilai; ?></td>
        		<td><?= $Keterangan; ?></td>
        	</tr>
        	<?php $no++;}?>
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