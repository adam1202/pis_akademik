<?php

	class Model_nilai extends CI_Model
	{

		public $table ="tbl_nilai";

		function save()
		{
			$data = array(
				//tabel di database => name di form
				'nisn'            => $this->input->post('nisn', TRUE),
				'nilai'          => $this->input->post('nilai', TRUE),
				'kd_mapel'          => $this->input->post('kd_mapel', TRUE)
			);
			$this->db->insert($this->table, $data);
		}

		function update()
		{
			$data = array(
				'nama_mapel'          => $this->input->post('nama_mapel', TRUE)
			);

			$kode_mapel	= $this->input->post('kd_mapel');
			$this->db->where('kd_mapel', $kode_mapel);
			$this->db->update($this->table, $data);
		}
		
	}

?>
