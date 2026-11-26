/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
create or alter procedure bronze.load_bronze as
begin

declare @start_time datetime ,@end_time datetime,@batch_start_time datetime,@batch_end_time datetime;

begin try
set @batch_start_time=GETDATE();


print '==========================================================================='
print 'loading bronze data'
print '==========================================================================='

print '==========================================================================='
print 'loading CRM data'
print '==========================================================================='

print '===============cust_info table============================================='
set @start_time=GETDATE();

truncate table bronze.crm_cust_info;
bulk insert bronze.crm_cust_info
from 'C:\Users\FMS-PC-2025\Desktop\PROJECTS\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with(
	firstrow=2,
	fieldterminator =',',
	tablock
	);
set @end_time=GETDATE();
print 'load time: ' + cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds';

print '===============prd_info table============================================='
set @start_time=GETDATE();
truncate table bronze.crm_prd_info;
	bulk insert bronze.crm_prd_info
from 'C:\Users\FMS-PC-2025\Desktop\PROJECTS\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with(
	firstrow=2,
	fieldterminator =',',
	tablock
	);
set @end_time=GETDATE();
print 'load time: ' + cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds';

print '===============crm_sales_details table============================================='
set @start_time=GETDATE();


truncate table bronze.crm_sales_details;

bulk insert bronze.crm_sales_details
from 'C:\Users\FMS-PC-2025\Desktop\PROJECTS\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with(
	firstrow=2,
	fieldterminator =',',
	tablock
	);
set @end_time=GETDATE();
print 'load time: ' + cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds';


print '==========================================================================='
print 'loading ERP data'
print '==========================================================================='


print '===============erp_cust_az12 table============================================='
set @start_time=GETDATE();

truncate table bronze.erp_cust_az12;

bulk insert bronze.erp_cust_az12
from 'C:\Users\FMS-PC-2025\Desktop\PROJECTS\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
with(
	firstrow=2,
	fieldterminator =',',
	tablock
	);
set @end_time=GETDATE();
print 'load time: ' + cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds';


print '===============erp_loc_a101 table============================================='
set @start_time=GETDATE();

truncate table bronze.erp_loc_a101;


bulk insert bronze.erp_loc_a101
from 'C:\Users\FMS-PC-2025\Desktop\PROJECTS\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
with(
	firstrow=2,
	fieldterminator =',',
	tablock
	);
set @end_time=GETDATE();
print 'load time: ' + cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds';

print '===============erp_px_cat_g1v2 table============================================='
set @start_time=GETDATE();

truncate table bronze.erp_px_cat_g1v2;

bulk insert bronze.erp_px_cat_g1v2
from 'C:\Users\FMS-PC-2025\Desktop\PROJECTS\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
with(
	firstrow=2,
	fieldterminator =',',
	tablock
	);
set @end_time=GETDATE();
print 'load time: ' + cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds';

set @batch_end_time=getdate();
print '==========================================================================='
	print 'Whole batch time ' + cast(datediff(second,@batch_start_time,@batch_end_time) as nvarchar) +'seconds';
print '==========================================================================='

end try
	begin catch
	print '==========================================================================='
	print 'error message' + error_message()
	print 'error message' + cast(error_number() as nvarchar(50))
	print '==========================================================================='
	end catch
	
end