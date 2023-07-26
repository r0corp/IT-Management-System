<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Create By : rochman@programmer.net
 */
class Type extends MY_Controller
{
	
	function __construct()
	{
		parent::__construct();
        $this->load->model(array('Mod_type'));
	}

	public function index()
	{
		$this->load->helper('url');
        $this->template->load('layoutbackend','asset_reports/type');
	}

	 public function ajax_list()
    {
        ini_set('memory_limit','512M');
        set_time_limit(3600);
        $list = $this->Mod_type->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $pel) {
            $no++;
            $row = array();
            $row[] = $pel->nama;
            $row[] = $pel->deskripsi;
            $row[] = $pel->created_at;
            $row[] = $pel->updated_at;
            $row[] = $pel->id;
            $data[] = $row;
        }

        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->Mod_type->count_all(),
                        "recordsFiltered" => $this->Mod_type->count_filtered(),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }

    public function insert()
    {
        $this->_validate();
        $date = date("Y-m-d H:i:s");
		$save  = array(
            'nama'			=> $this->input->post('nama'),
            'deskripsi'  	=> $this->input->post('deskripsi'),
            'created_at'  	=> $date,
            'updated_at'  	=> $date
        );
            $this->Mod_type->insert_type("aset_tipe", $save);
            echo json_encode(array("status" => TRUE));
    }

    public function update()
    {
        $this->_validate();
        $id      = $this->input->post('id');
        $date = date("Y-m-d H:i:s");
        $save   = array(
            'nama'          => $this->input->post('nama'),
            'deskripsi'     => $this->input->post('deskripsi'),
            'created_at'  	=> $date,
            'updated_at'  	=> $date
        );
        $this->Mod_type->update_type($id, $save);
        echo json_encode(array("status" => TRUE));
    }

    public function edit_type($id)
    {
            $data = $this->Mod_type->get_type($id);
            echo json_encode($data);
    }

    public function delete()
    {
        $id = $this->input->post('id');
        $this->Mod_type->delete_type($id, 'aset_tipe');        
        echo json_encode(array("status" => TRUE));
    }
    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('nama') == '')
        {
            $data['inputerror'][] = 'nama';
            $data['error_string'][] = 'Type Cannot Be Empty';
            $data['status'] = FALSE;
        }

        if($this->input->post('deskripsi') == '')
        {
            $data['inputerror'][] = 'deskripsi';
            $data['error_string'][] = 'Description Cannot Be Empty';
            $data['status'] = FALSE;
        }

        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }
}