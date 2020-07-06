<?php

	class Model_siswa extends CI_Model
	{

		function report() {
			$this->db->from("tbl_siswa");
			$this->db->join("tbl_agama", "tbl_agama.kd_agama = tbl_siswa.kd_agama");
			$this->db->join("tbl_kelas", "tbl_kelas.kd_kelas = tbl_siswa.kd_kelas");
			$query = $this->db->get();
			return $query;
		}

		function report_nilai($nisn) {
			$this->db->select("*");
			$this->db->from("tbl_nilai");
			$this->db->join("tbl_mapel", "tbl_mapel.kd_mapel = tbl_nilai.kd_mapel");
			$this->db->join("tbl_siswa", "tbl_siswa.nisn = tbl_nilai.nisn");
			$this->db->where($nisn);
			$query = $this->db->get();
			return $query;
		}



		// public function tigatable($aktif) {
		// 	$this->db->select('*');
		// 	$this->db->from('tbrakyat');
		// 	$this->db->join('tbsekolah','tbsekolah.id=tbrakyat.id');
		// 	$this->db->join('tbstatus','tbstatus.idpendidikan=tbsekolah.idpendidikan');
		// 	$this->db->where($aktif);
		// 	$query = $this->db->get();
		// 	return $query->result();
		//    }

		// public function cetak_id($nisn) {
		// 	$data = array(
		// 	 'record'  => $this->db->query("SELECT * FROM siswa where ='$id'"),
		//    );
		//    $this->load->view('v_cetak',$data);
		//    $html = $this->output->get_output();
		//    $this->load->library('dompdf_gen');
		//    $this->dompdf->load_html($html);
		//    $this->dompdf->render();
		//    $sekarang=date("d:F:Y:h:m:s");
		//    $this->dompdf->stream("pendaftaran".$sekarang.".pdf",array('Attachment'=>0));
		// }

		public $table ="tbl_siswa";

		function save($foto)
		{
			$data = array(
				//tabel di database => name di form
				'nisn'           => $this->input->post('nisn', TRUE),
				'nama'          => $this->input->post('nama', TRUE),
				'jenis_kelamin'  => $this->input->post('jenis_kelamin', TRUE),
				'tanggal_lahir' => $this->input->post('tanggal_lahir', TRUE),
				'tempat_lahir'  => $this->input->post('tempat_lahir', TRUE),
				
				'kd_agama'	    => $this->input->post('agama', TRUE),
				'foto'			=> $foto,
				'kd_kelas'	    => $this->input->post('kelas', TRUE),
			);
			$this->db->insert($this->table, $data);

			// ketika pengguna menginsert data siswa, maka data nisn, kd_kelas dan tahun_akademik_aktif akan otomatis terinsert dengan sendirinya ke tbl_riwayat_kelas
			$tahun_akademik = $this->db->get_where('tbl_tahun_akademik', array('is_aktif' => 'Y'))->row_array();
			$riwayat = array(
							'nisn' 				=> $this->input->post('nisn', TRUE),
							'kd_kelas'			=> $this->input->post('kelas', TRUE),
							'id_tahun_akademik'	=> $tahun_akademik['id_tahun_akademik']
						); 
			$this->db->insert('tbl_riwayat_kelas', $riwayat);
		}

		function update($foto)
		{
			if (empty($foto)) {
				//update tanpa foto
				$data = array(
					'nama'          => $this->input->post('nama', TRUE),
					'jenis_kelamin' => $this->input->post('jenis_kelamin', TRUE),
					'tanggal_lahir' => $this->input->post('tanggal_lahir', TRUE),
					'tempat_lahir'  => $this->input->post('tempat_lahir', TRUE),
					'kd_agama'	    => $this->input->post('agama', TRUE),
					'kd_kelas'	    => $this->input->post('kelas', TRUE),
				);
			} else {
				//update dengan foto
				$data = array(
					'nama'          => $this->input->post('nama', TRUE),
					'jenis_kelamin' => $this->input->post('jenis_kelamin', TRUE),
					'tanggal_lahir' => $this->input->post('tanggal_lahir', TRUE),
					'tempat_lahir'  => $this->input->post('tempat_lahir', TRUE),
					'kd_agama'	    => $this->input->post('agama', TRUE),
					'foto'			=> $foto,
					'kd_kelas'	    => $this->input->post('kelas', TRUE),
				);
			}

			$nisn	= $this->input->post('nisn');
			$this->db->where('nisn', $nisn);
			$this->db->update($this->table, $data);
		}

		// Fungsi untuk melakukan proses upload file
	  	public function upload_csv($filename){
		    $this->load->library('upload'); // Load librari upload
		    
		    $config['upload_path'] = './csv/';
		    $config['allowed_types'] = 'csv';
		    $config['max_size']  = '2048';
		    $config['overwrite'] = true;
		    $config['file_name'] = $filename;
		  
		    $this->upload->initialize($config); // Load konfigurasi uploadnya
		    if($this->upload->do_upload('file')){ // Lakukan upload dan Cek jika proses upload berhasil
		      // Jika berhasil :
		      $return = array('result' => 'success', 'file' => $this->upload->data(), 'error' => '');
		      return $return;
		    }else{
		      // Jika gagal :
		      $return = array('result' => 'failed', 'file' => '', 'error' => $this->upload->display_errors());
		      return $return;
		    }
		  }
	  
		// Buat sebuah fungsi untuk melakukan insert lebih dari 1 data
		public function insert_multiple($data){
		    $this->db->insert_batch('tbl_siswa', $data);
		}

	}
	
?>
