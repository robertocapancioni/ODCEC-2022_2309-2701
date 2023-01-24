begin
    --D241_CLIENTE: 25/10000 righe esportate, APEX$DATA$PKG/D241_CLIENTE$777073
    apex_data_install.load_supporting_object_data(p_table_name => 'D241_CLIENTE', p_delete_after_install => true );
    --D241_TIPO_PRODOTTO: 12/10000 righe esportate, APEX$DATA$PKG/D241_TIPO_PRODOTTO$808864
    apex_data_install.load_supporting_object_data(p_table_name => 'D241_TIPO_PRODOTTO', p_delete_after_install => true );
    --D241_PRODOTTO: 77/10000 righe esportate, APEX$DATA$PKG/D241_PRODOTTO$725720
    apex_data_install.load_supporting_object_data(p_table_name => 'D241_PRODOTTO', p_delete_after_install => true );
    --D241_VENDITA: 500/10000 righe esportate, APEX$DATA$PKG/D241_VENDITA$884533
    apex_data_install.load_supporting_object_data(p_table_name => 'D241_VENDITA', p_delete_after_install => true );
end;
