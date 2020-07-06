<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cetak extends CI_Controller {
 function __construct(){
  parent::__construct();
 }

 public function index(){
  $data = array(
   'record' => $this->db->get('siswa')
  );
  $this->load->view('v_index',$data);
 }

 public function cetak_id($nisn) {
     $data = array(
      'record'  => $this->db->query("SELECT * FROM tbl_nilai where nisn='$nisn'"),
    );
    $this->load->view('v_cetak',$data);
    $html = $this->output->get_output();
    $this->load->library('dompdf_gen');
    $this->dompdf->load_html($html);
    $this->dompdf->render();
    $sekarang=date("d:F:Y:h:m:s");
    $this->dompdf->stream("pendaftaran".$sekarang.".pdf",array('Attachment'=>0));
 }
}
