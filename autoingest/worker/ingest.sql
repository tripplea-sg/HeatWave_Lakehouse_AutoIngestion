SET @input_list = '[{"db_name": "v_comp", "tables": [{"table_name": "v_segment","engine_attribute": {"dialect": {"format": "csv","is_strict_mode": false,"field_delimiter": "|", "record_delimiter": "\\n", "check_constraints": false, "allow_missing_files": true,"quotation_marks": "###", "has_header": true},"file": [{"prefix": "data/v_comp/v_segment","bucket": "v_bucket", "region": "v_region", "namespace": "v_namespace"}]}}]}]';
SET @options = JSON_OBJECT('mode', 'normal');
CALL sys.heatwave_load(CAST(@input_list AS JSON), @options);
