<?php
defined('BASEPATH') or exit('No direct script access allowed');
/**
 * Create By : rochman@programmer.net
 */
class Mod_merek extends CI_Model
{
	var $table = 'merek';
	var $column_search = array('id_merek', 'nama_merek');
	var $column_order = array('id_merek', 'nama_merek');
	var $order = array('id_merek' => 'desc');
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	private function _get_datatables_query()
	{

		$this->db->from('merek');
		$i = 0;

		foreach ($this->column_search as $item) // loop column 
		{
			if ($_POST['search']['value']) // if datatable send POST for search
			{

				if ($i === 0) // first loop
				{
					$this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
					$this->db->like($item, $_POST['search']['value']);
				} else {
					$this->db->or_like($item, $_POST['search']['value']);
				}

				if (count($this->column_search) - 1 == $i) //last loop
					$this->db->group_end(); //close bracket
			}
			$i++;
		}

		if (isset($_POST['order'])) // here order processing
		{
			$this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
		} else if (isset($this->order)) {
			$order = $this->order;
			$this->db->order_by(key($order), $order[key($order)]);
		}
	}

	function get_datatables()
	{
		$this->_get_datatables_query();
		if ($_POST['length'] != -1)
			$this->db->limit($_POST['length'], $_POST['start']);
		$query = $this->db->get();
		return $query->result();
	}

	function count_filtered()
	{
		$this->_get_datatables_query();
		$query = $this->db->get();
		return $query->num_rows();
	}

	function count_all()
	{
		$this->db->from('merek');
		return $this->db->count_all_results();
	}

	function insert_merek($table, $data)
	{
		$insert = $this->db->insert($table, $data);
		return $insert;
	}

	function update_merek($id, $data)
	{
		$this->db->where('id_merek', $id);
		$this->db->update('merek', $data);
	}

	function get_merek($id)
	{
		$this->db->where('id_merek', $id);
		return $this->db->get('merek')->row();
	}

	function delete_merek($id, $table)
	{
		$this->db->where('id_merek', $id);
		$this->db->delete($table);
	}
}
