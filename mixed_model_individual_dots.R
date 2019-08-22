afex_plot(m_nocor_noint_noprob, x = "prob",trace = "val",panel = "type",
          id="id",error = "within",dodge = 0.8, # control the distance of bars
          mapping = c("fill","linetype"),
          data_geom = ggpol::geom_boxjitter,
          data_arg = list(
            width = 0.6, # control the width of box
            jitter.width = 0.04,
            jitter.height = 0,
            jitter.alpha = 0.3,
            outlier.intersect = TRUE, 
            outlier.color = "black",
            outlier.shape = 24,
            outlier.size = 1.5,
            errorbar.draw = TRUE),
          line_arg = list(aes(color=val), linetype = 1,size = 0.7,show.legend = FALSE),
          point_arg = list(size = 0), # get rid of default points 
          error_arg = list(size = 0.8, width = 0.15,linetype=1),
          factor_levels = list(val = c("Cued","Uncued"),
                               type = c("Precue","Retrocue")),
          legend_title = "Validity")+
  labs(y="Attentional capture (ms)", x = "Cue probability")+
  ggpubr::theme_pubr()+ggsci::scale_fill_npg()+ggsci::scale_color_nejm()+
  geom_hline(yintercept = 0,alpha=0.7,linetype="longdash")+
  geom_point(aes(color=val),size = 2.5,position = position_dodge(width = 0.8),show.legend = FALSE)+
  geom_point(color="white",size=1.5,position = position_dodge(width = 0.8),show.legend = FALSE) # add my own points