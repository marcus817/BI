select vee.ve_nr, vee.me_lance, vee.est_cd, vee.me_dtent, me.nf_lanc, nfe.nf_nr, 
	(SELECT CASE WHEN ob.ob_dtpag IS NULL THEN 'N' ELSE 'S' END from scp_ob as ob WHERE ob.nf_lanc = nfe.nf_lanc and tpo_cd not in ( 'IC')) as vecpg
from vec_vee as vee
inner join vec_me as me on me.me_lanc = vee.me_lance and me.ve_nr = vee.ve_nr
left join ger_nfev as nfev on nfev.nf_lanc = me.nf_lanc and nfev.ve_nr = nfev.ve_nr
left join ger_nfe as nfe on nfe.nf_lanc = me.nf_lanc  
where vee.me_dtsai is null
and vee.me_dtent is not null
and me.me_dt = vee.me_dtent