<?php 

class Pembayaran_model extends CI_Model

{

 
    public function getPembayaran($id=null)
    
    {
        if ($id===null) {
            return $this->db->get('detail_pembayaran')->result_array();  
        }else {
            return $this->db->get_where('detail_pembayaran',['id_faspay_pembayaran'=>$id])->result_array();

        }
        
        
    }


    public function deletePembayaran($id)
        {
            $this->db->delete('detail_pembayaran',['id_faspay_pembayaran'=> $id]);
            return $this->db->affected_rows();
        }


    public function createPembayaran($data)
    {
        $this->db->insert('detail_pembayaran',$data);
        return $this->db->affected_rows();
    }

    public function updatePembayaran($data, $id)
    {
        $this->db->update('detail_pembayaran',$data,['pembayaran'=>$id]);
        return $this->db->affected_rows();
    }
}
