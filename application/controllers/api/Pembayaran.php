<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
/** @noinspection PhpIncludeInspection */
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller;
class Pembayaran extends REST_Controller
{

    public function __construct(){

        parent::__construct();
        $this->load->model('Pembayaran_model','pembayaran');

        $this->methods['index_get']['limit'] = 200;
    }
    public function index_get()
    {
        $id=$this->get('id_faspay_pembayaran');
        if ($id===null) {
            $pembayaran=$this->pembayaran->getPembayaran();
        }else {
            $pembayaran=$this->pembayaran->getPembayaran($id);
        }


        
        if ($pembayaran) {
            $this->response([
                'status'=>true,
                'data'=>$pembayaran
            ],REST_Controller::HTTP_OK);
            # code...
        }else {
            # code...

            $this->response([
                'status'=>false,
                'message'=>'id pembayaran tidak di temukan'
            ],REST_Controller::HTTP_NOT_FOUND);
        }
    }
    

    public function index_delete()
    {
        $id =$this->delete('id_faspay_pembayarn');
        if ($id===null) {
            $this->response([
                'status'=>false,
                'message'=>'Tolong inputkan id_pembayaran!'
            ],REST_Controller::HTTP_BAD_REQUEST);
            # code...
        }else {
            # code...
            if ($this->pembayaran->deletePembayaran($id) > 0) {
                # code...
                //ok
                $this->response([
                    'status'=>true,
                    'data'=>$id,
                    'message'=>'terhapus.'
                ],REST_Controller::HTTP_NO_CONTENT);
            }else {
                # not found
                $this->response([
                    'status'=>false,
                    'message'=>'id pembayaran tidak di temukan!'
                ],REST_Controller::HTTP_BAD_REQUEST);
            }
        }
    }



    public function index_post()
    {
        $this->load->helper('string');
        $trx_id=random_string('numeric',5);
        $nis=$this->post('nis');


//genereate  kode respon

        $data=[
                'tanggal'=> date("Y-m-d H:i:s"),
                'batas_bayar'=>date("Y-m-d H:i:s",mktime(date('H'),date('i'),date('s'),date('m'),date('d')+1,date('Y'))),
				'nis'=>$nis,
				'time_post'=>date("H:i:s"),
				'time_respon'=>date("H:i:s"),
				'trx_id'=>$trx_id,
				'va'=>$nis.$trx_id,
				'nominal'=>$this->post('nominal'),
				'status'=>'a'

            //menambah klom kode respon
        ];

        if ($this->pembayaran->createPembayaran($data)>0) {
            $this->response([
                'status'=>true,
                'data'=>$data,//menambah kan data
                'message'=>'data pembayaran berhasil di tambahkan.'
            ],REST_Controller::HTTP_CREATED);
        }else {
            # code...
            $this->response([
                'status'=>false,
                'message'=>'gagal menambahkan data pembayaran'
            ],REST_Controller::HTTP_BAD_REQUEST);
        }
    }



    public function index_put()
    {

        $id=$this->put('id_pembayaran');
        $data=[
            'id_siswa'=>$this->put('id_siswa'),
            'id_kelas'=>$this->put('id_kelas'),
        ];

        if ($this->mahasiswa->updatePembayaran($data,$id) > 0) {
            $this->response([
                'status'=>true,
                'message'=>'data pembayaran berhasil di ubah.'
            ],REST_Controller::HTTP_NO_CONTENT);
        }else {
            # code...
            $this->response([
                'status'=>false,
                'message'=>'gagal ubah data pembayaran'
            ],REST_Controller::HTTP_BAD_REQUEST);
        }
    }
}



