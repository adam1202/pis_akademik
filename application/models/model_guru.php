<?php

  class Model_guru extends CI_Model
  {

        function report() {
      $this->db->from("tbl_guru");
      $query = $this->db->get();
      return $query;
    }


    public $table = "tbl_guru";

    function save()
    {
      $data = array(
        //tabel di database => name di form
        'nip'       => $this->input->post('nip', TRUE),
        'nama_guru'   => $this->input->post('nama_guru', TRUE),
        'jenis_kelamin'      => $this->input->post('jenis_kelamin', TRUE),
        'username'    => $this->input->post('username', TRUE),
        'password'    => md5($this->input->post('password', TRUE)),
      );
      $this->db->insert($this->table, $data);
    }



    function update()
    {
      $data = array(
        //tabel di database => name di form
        'nip'       => $this->input->post('nip', TRUE),
        'nama_guru'   => $this->input->post('nama_guru', TRUE),
        'jenis_kelamin'      => $this->input->post('jenis_kelamin', TRUE),
        'username'    => $this->input->post('username', TRUE),
        'password'    => md5($this->input->post('password', TRUE)),
        //'semester_aktif'  = $this->input->post('semester_aktif', TRUE)
      );
      $id_guru = $this->input->post('id_guru');
      $this->db->where('id_guru', $id_guru);
      $this->db->update($this->table, $data);
    }

    function login($username, $password)
    {
      $this->db->where('username', $username);
      $this->db->where('password', md5($password));
      $user = $this->db->get('tbl_guru')->row_array();
      return $user;
    }

  }

?>