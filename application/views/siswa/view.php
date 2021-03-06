<section class="content">
<div class="row">
    <div class="col-xs-12">

      <div class="box box-primary">
        <div class="box-header  with-border">
          <h3 class="box-title">Data Siswa</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">

        <!-- button add -->
        <?php
    
            echo anchor('siswa/add', '<button class="btn bg-navy btn-flat margin">Tambah Data</button>');
            echo anchor('siswa/form', '<button class="btn btn-warning btn-flat margin">Import Data</button>');
        ?>

<a href="siswa/report" target="_blank" class="btn btn-danger btn-flat margin">Cetak</a>

<div id="printableArea">

          <table id="mytable" class="table table-striped table-bordered table-hover table-full-width dataTable" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>FOTO</th>
                    <th>NISN</th>
                    <th>NAMA</th>
                    <th>JENIS KELAMIN</th>
                    <th>TEMPAT LAHIR</th>
                    <th>TANGGAL LAHIR</th>
                    <th>AKSI</th>
                </tr>
            </thead>
          </table>
</div>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
</div>
<!-- /.row -->
</section>

<!-- punya lama -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.0/jquery.dataTables.js"></script> -->
<!-- <script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.js"></script> -->

<!-- baru tapi cdn -->
<!-- <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css"> -->

<script src="<?php echo base_url(); ?>assets/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<?php echo base_url(); ?>assets/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

<script>
    $(document).ready(function() {
        var t = $('#mytable').DataTable( {
            "ajax": '<?php echo site_url('siswa/data'); ?>',
            "order": [[ 2, 'asc' ]],
            "columns": [
                {
                    "data": null,
                    "width": "50px",
                    "class": "text-center",
                    "orderable": false,
                },
                { 
                    "data": "foto",
                    "class": "text-center"
                },
                {
                    "data": "nisn",
                    "width": "120px",
                    "class": "text-center"
                },
                { 
                    "data": "nama",
                },
                {
                    "data" : "jenis_kelamin",
                },
                { 
                    "data": "tempat_lahir",
                    "width": "150px"
                },
                { 
                    "data": "tanggal_lahir", 
                    "width": "150px",
                    "class": "text-center"
                },
                { 
                    "data": "aksi",
                    "width": "80px",
                    "class": "text-center"
                },
            ]
        } );
           
        t.on( 'order.dt search.dt', function () {
            t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                cell.innerHTML = i+1;
            } );
        } ).draw();
    } );
</script>

    
<script>
function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
</script>