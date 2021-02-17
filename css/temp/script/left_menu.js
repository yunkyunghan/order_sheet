 
function toggle_submenu( group_no, num )
{
	var element = null;	
	for( var i = 1; i <= num; i++ )
	{
	element = document.getElementById( "submenu_group_" + group_no + "_" + i );		
		if ( element != null )
		{
			( element.style.display != "none" ) ? element.style.display = "none" : element.style.display = "";
		}
	}
	return;
}
function toggle_img_src( name, src_a, src_b )
{
	var img = eval('document.' + name);	
	if( img.length == 0 ) return;	
	if ( img.src.indexOf( src_a ) >= 0 )
	{
		img.src = src_b;
		return;
	}
	
	if ( img.src.indexOf( src_b ) >= 0 )
	{
		
		img.src = src_a;	
		return;
	}
	return; }

 
