<?php
 
	class Nilai extends CI_Controller
	{

        function report() {
      $this->db->from("tbl_nilai");
      $query = $this->db->get();
      return $query;
    }


		function __construct()
		{
			parent::__construct();
			//checkAksesModule();
			$this->load->library('ssp');
			$this->load->model('model_nilai');
		}

		function data()
		{

			// nama table
			$table      = 'tbl_siswa';
			// nama PK
			$primaryKey = 'nisn';
			// list field yang mau ditampilkan
			$columns    = array(
				//tabel db(kolom di database) => dt(nama datatable di view)
				array('db' => 'foto', 
					  'dt' => 'foto',
					  'formatter' => function($d) {
					  		return "<img width='20px' src='".base_url()."/uploads/".$d."'>";
					  }
				),
				array('db' => 'nisn', 'dt' => 'nisn'),
		        array('db' => 'nama', 'dt' => 'nama'),
		        array('db' => 'tempat_lahir', 'dt' => 'tempat_lahir'),
		        array('db' => 'tanggal_lahir', 'dt' => 'tanggal_lahir'),
		        //untuk menampilkan aksi(edit/delete dengan parameter nisn siswa)
		        array(
		              'db' => 'nisn',
		              'dt' => 'aksi',
		              'formatter' => function($d) {
		               		return anchor('siswa/add_nilai/'.$d, '<button class="btn bg-navy btn-flat margin">Tambah Data</buttton>', ' data-placement="top" title="Add"').' 
		               		'.anchor('siswa/delete/'.$d, '<i class="fa fa-times fa fa-white"></i>', 'class="btn btn-xs btn-danger" data-placement="top" title="Delete"');
		            }
				)
		    );

			$sql_details = array(
				'user' => $this->db->username,
				'pass' => $this->db->password,
				'db'   => $this->db->database,
				'host' => $this->db->hostname
		    );

		    echo json_encode(
		     	SSP::simple($_GET, $sql_details, $table, $primaryKey, $columns)
			 );
		}
		
		function index()
		{

	// 		$sql = "SELECT tj.kd_kelas, tj.id_jadwal, tju.nama_jurusan, ttk.nama_tingkatan, tm.nama_mapel, tj.jam, 
	// 		tr.nama_ruangan, tj.hari, tj.semester 
	// 		FROM tbl_jadwal AS tj, tbl_jurusan AS tju, tbl_ruangan AS tr, tbl_mapel AS tm, tbl_tingkatan_kelas AS ttk
	// 		WHERE tj.kd_jurusan = tju.kd_jurusan AND tj.kd_ruangan = tr.kd_ruangan AND tj.kd_mapel = tm.kd_mapel AND tj.kd_tingkatan = ttk.kd_tingkatan AND tj.id_guru =".$this->session->userdata('id_guru');
	// $data['jadwal'] =$this->db->query($sql);
			$sql = "SELECT tj.kd_kelas, tj.id_jadwal, tju.nama_jurusan, ttk.nama_tingkatan, tm.nama_mapel, tj.jam, 
					tr.nama_ruangan, tj.hari, tj.semester 
					FROM tbl_jadwal AS tj, tbl_jurusan AS tju, tbl_ruangan AS tr, tbl_mapel AS tm, tbl_tingkatan_kelas AS ttk
					WHERE tj.kd_jurusan = tju.kd_jurusan AND tj.kd_ruangan = tr.kd_ruangan AND tj.kd_mapel = tm.kd_mapel AND tj.kd_tingkatan = ttk.kd_tingkatan AND tj.id_guru =".$this->session->userdata('id_guru');
			$data['jadwal'] =$this->db->query($sql);
			$this->template->load('template', 'nilai/list_kelas', $data);
		}

		function kelas()
		{
			$id_jadwal		= $this->uri->segment(3);
			$jadwal 		= $this->db->get_where('tbl_jadwal', array('id_jadwal' => $id_jadwal))->row_array();
			$kd_kelas 		= $jadwal['kd_kelas'];
			// $kelas 			= "SELECT tk.*, tj.nama_jurusan, ttk.nama_tingkatan 
			// 		  		  FROM tbl_kelas AS tk, tbl_jurusan AS tj, tbl_tingkatan_kelas AS ttk
			// 		  		  WHERE tk.kd_jurusan = tj.kd_jurusan AND tk.kd_tingkatan = ttk.kd_tingkatan AND kd_kelas = '$kd_kelas'";

			// Punya akademik nuris
			
			// $rombel         =   "SELECT rb.nama_rombel,rb.kelas,jr.nama_jurusan, mp.nama_mapel
   			//                 FROM tbl_jadwal AS j,tbl_jurusan as jr, tbl_rombel as rb,tbl_mapel as mp
   			//                 WHERE j.kd_jurusan=jr.kd_jurusan and rb.id_rombel=j.id_rombel and mp.kd_mapel=j.kd_mapel 
   			//                 and j.id_jadwal=13='$id_rombel'";
			
			$kelas 			= "SELECT tk.nama_kelas, tju.nama_jurusan, tm.nama_mapel, ttk.nama_tingkatan 
							  FROM tbl_jadwal AS tj, tbl_jurusan AS tju,  tbl_kelas AS tk, tbl_mapel AS tm, tbl_tingkatan_kelas AS ttk
							  WHERE tj.kd_jurusan = tju.kd_jurusan AND tj.kd_kelas = tk.kd_kelas AND tj.kd_mapel = tm.kd_mapel AND tj.kd_tingkatan = ttk.kd_tingkatan AND tj.id_jadwal = $id_jadwal";
			$siswa 			= "SELECT ts.nim, ts.nama 
							  FROM tbl_riwayat_kelas AS trk, tbl_siswa AS ts 
							  WHERE trk.nim = ts.nim AND trk.kd_kelas = '$kd_kelas' AND trk.id_tahun_akademik =". get_tahun_akademik('id_tahun_akademik') ." ";
			$data['kelas']  = $this->db->query($kelas)->row_array();
			$data['siswa']  = $this->db->query($siswa)->result();
			$this->template->load('template', 'nilai/form_nilai', $data);
		}

		function update_nilai()
		{
			$nim		= $_GET['nim'];
			$idjadwal 	= $_GET['id_jadwal'];
			$nilai 		= $_GET['nilai'];

			$parameter 	= array(
							'nim' => $nim,
							'id_jadwal' => $idjadwal,
							'nilai' => $nilai
						);

			$validasi 	= array(
							'nim' => $nim,
							'id_jadwal' => $idjadwal
						);

			$check 		= $this->db->get_where('tbl_nilai', $validasi);
			if ($check->num_rows() > 0) {
				// Apabila datanya besar dari 0 / ada maka akan melakukan proses update
				$this->db->where('nim', $nim);
				$this->db->where('id_jadwal', $idjadwal);
				$this->db->update('tbl_nilai', array('nilai' => $nilai));
				echo "data diupdate";
			} else {
				// Jika datanya tidak ada maka akan melakukan proses insert
				$this->db->insert('tbl_nilai', $parameter);
				echo "data diinsert";
			}
		}

		function add_nilai($nisn = NULL)
		{
		  if (isset($_POST['submit'])) {
			$this->model_nilai->save();
			redirect('siswa/siswa_aktif');
		  } else {
			$this->template->load('template', 'siswa/add_nilai');
			echo $nisn;
		  }
		}

		function edit()
		{
			if (isset($_POST['submit'])) {
				$uploadFoto = $this->upload_foto_siswa();
				$this->model_siswa->update($uploadFoto);
				redirect('siswa');
			} else {
				$nisn           = $this->uri->segment(3);
				$data['siswa'] = $this->db->get_where('tbl_siswa', array('nisn' => $nisn))->row_array();
				$this->template->load('template', 'siswa/edit', $data);
			}
		}

		// function get_siswa_by_nisn(){
		// 	{
		// 		if(isset($_POST['submit'])){
		// 			$this->model_nilai->get
		// 		}
		// 	}
		// }

	}

?>