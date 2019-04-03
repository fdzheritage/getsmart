<?php

class NavMenu {
    private $id;
    private $menuItems = array();

    public function __construct($id = 'mainNav', $rows = null)
    {
        $this->id = $id;     
        if ( !empty($rows) ) {
           loadRows($rows);
        }  
    }

    private function loadRows($rows) {
        foreach ($rows as $item) {
            $this->addItem($item['key'], $item['label'], $item['order']);
        }
    }

    
    public function loadData($sql){
        $pdo = $GLOBALS['pdo'];
        $menu_data = $pdo->query($sql);
        $this->loadRows($menu_data);
    }

    public function __toString() {
        $output = '<nav id="' . $this->id .  '">';
        foreach ($this->menuItems as $item) {
            $output .= '<a class="' . ($item['active'] ? 'active' : 'inactive') . '" href="?p=' . $item['key'] . '">' . $item['label'] . '</a>';
        }
        $output .= '</nav>';
        return $output;
    }

    public function setActive($key = '') {
        foreach($this->menuItems as $index => $item ) {
            // Different than Lucas
            $this->menuItems[$index]['active'] = ($item['key'] == $key);
        }
    }

    public function addItem($key, $label, $order = 0 ) {
        $key = trim(strtolower(str_replace(' ','',$key)));
        $this->menuItems[] = array(
            'key'=>$key, 
            'label'=>$label, 
            'order'=>$order,
            'active'=> false
        );

        usort($this->menuItems, function( $a, $b){
            // Different than Lucas
            return $a['order'] - $b['order']; 
        });
    }



}

