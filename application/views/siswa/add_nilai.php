<section class="content">
    <div class="row">
        <div class="col-xs-12">

          <div class="box box-primary">
            <div class="box-header with-border">
            <?php
                    $nisn   = $this->uri->segment(3);
                    $query = "SELECT ts.nama, tm.kd_mapel

                            FROM tbl_nilai AS tn, tbl_siswa AS ts, tbl_mapel AS tm
                            WHERE tn.kd_mapel = tm.kd_mapel AND tn.nisn = ts.nisn AND tn.nisn = '$nisn'";
                    $nama = $this->db->query($query)->row_array();
                ?>
                <h3 class="box-title">Form Tambah Nilai <?php echo $nama['nisn']; ?> </h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <?php
                echo form_open('nilai/add_nilai', 'role="form" class="form-horizontal"');
                // echo form_hidden('nisn', $nisn['nisn']);
            ?>

                <div class="box-body">

                <div class="form-group">
                      <label class="col-sm-2 control-label">Nisn</label>

                      <div class="col-sm-9">
                      <input type="text" value="<?php echo $nisn['nisn']; ?>" name="nisn" class="form-control" placeholder="Masukkan Nisn">
                      </div>
                  </div>
                  
                  <div class="form-group">
                      <label class="col-sm-2 control-label">Nilai </label>
              
                      <div class="col-sm-9">
                        <input type="text" name="nilai" class="form-control" placeholder="Masukkan Nilai">
                      </div>
                  </div>

                  <div class="form-group">
                      <label class="col-sm-2 control-label">Mata Pelajaran</label>

                      <div class="col-sm-9">
                      <?php
                         echo form_dropdown('kd_mapel', array('Pilih Mata Pelajaran', 'BIDP'=>'Bahasa Indonesia Pengetahuan', 
                         'BIDK'=>'Bahasa Indonesia Keterampilan', 'BINGP'=>'Bahasa Inggris Pengetahuan', 'BINGK'=>'Bahasa Inggris Keterampilan',
                        'BLAMP'=>'Bahasa Lampung Pengetahuan', 'BLAMP'=>'Bahasa Lampung Keterampilan', 'IPAP'=>'Ilmu Pengetahuan Alam Pengetahuan', 'IPAPK'=>'Ilmu Pengatahuan Alam Keterampilan',
                        'IPSK'=>'Ilmu Pengetahuan Sosial Keterampilan', 'IPSP'=>'Ilmu Pengatahuan Sosial Pengetatahun', 'MTKK'=>'Matematika Keterampilan', 'MTKP'=>'Matematika Pengetahuan',
                        'PABPK'=>'Pendidikan Agama Dan Budi Pekerti Keterampilan', 'PBPPP'=>'Pendidikan Agama Dan Budi Pekerti Pengetahuan',
                        'PJOKK'=>'Pendidikan jasmani Dan Olahraga Kesehatan Keterampilan', 'PJOKP'=>'Pendidikan Jasmani Dan Olahraga Kesehatan Pengetahuan',
                        'PKNK'=>'Pendidikan Kewarganegaraan Keterampilan','PKNP'=>'Pendidikan Kewarganegaraan Pengetahuan', 'SBK'=>'Seni Budaya Keterampilan ', 'SBP'=>'Seni Budaya Pengetahuan'), NULL, "class='form-control'");
                      ?> 
                        <!-- <input type="text" name="kd_mapel" class="form-control" placeholder="Masukkan Kode Mapel"> -->
                      </div>
                  </div>

                  <div class="form-group">
                      <label class="col-sm-2 control-label"></label>

                      <div class="col-sm-1">
                        <button type="submit" name="submit" class="btn btn-primary btn-flat">Simpan</button>
                      </div>

                      <div class="col-sm-1">
                        <?php
                          echo anchor('mapel', 'Kembali', array('class'=>'btn btn-danger btn-flat'));
                        ?>
                      </div>
                  </div>

                </div>
                <!-- /.box-body -->
            </form>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>