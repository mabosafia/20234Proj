<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <script>
                    document.onreadystatechange = function(){
                    
                        if (document.readyState === "complete") {
                        //uiWebview_ScrollTo();
                        }
                        else {
                            window.onload = function () {
                              // myFunction();
                            };
                        }
                    }
                   function uiWebview_ScrollTo() {
                   
                  var naar = document.getElementsByClassName("spanKey");
                  
                      if(naar.length>0)
                      {
                        
                       naar[0].scrollIntoView();
                      }
                  }
                  
                  
                    </script>
            </head>
            <body style="padding:4px;text-align: justify;text-justify: inter-word;font-family:[fontName];font-size: [fontSize];background-color:[color];color:#000000;" >
                <div dir="rtl"  >
                    <xsl:apply-templates />
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="عنوان-ف">
        <xsl:for-each select=".">
            <div dir="rtl" style="text-align:center;font-weight: bold;font-family:[fontName];color:#000000;" >
                <xsl:value-of select="."/>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="اسم">
        <xsl:for-each select=".">
            <span dir="rtl" style="color:#660066;" >
                <xsl:value-of select="."/>
            </span>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="صفحة">
        
        <span  dir="rtl" style="color:#3333ff;" >
            [ص : <xsl:value-of select= "@رقم" />]
        </span>
        <br/>
    </xsl:template>
    
    <xsl:template match="هامش">
        <xsl:for-each select=".">
         <a id="hamishlink{generate-id()}"
             href="index.html?id={.}">
             <img src="Bookmark.png" width="25" height="25" border="0"/>
         </a>
         
               <input type="hidden" id="#{generate-id()}" value="{.}" />
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="صورة">
        <xsl:for-each select=".">
            <br/>
            <div style="text-align:center;" >
            <xsl:variable name="imagefile"><xsl:value-of select="translate(., ' ', '')"/></xsl:variable>
            <img src="{$imagefile}" width="90%"   border="0"/>
            <br/>
            </div>
            
        </xsl:for-each>
    </xsl:template>
    
    
        
        <xsl:template match="قرآن">
            <xsl:for-each select=".">
                <span dir="rtl" style="color:#8F0003;" >
                    <xsl:value-of select="."/>
                </span>
            </xsl:for-each>
        </xsl:template>
        
        <xsl:template match="متن-ح">
            <xsl:for-each select=".">
                <span dir="rtl" style="color:#136D03;" >
                    <xsl:value-of select="."/>
                </span>
            </xsl:for-each>
        </xsl:template>
        
        <xsl:template match="نه">
            <br />
        </xsl:template>
        
        <xsl:template match="سميك">
            <xsl:for-each select=".">
                <b>
                    <xsl:value-of select="."/>
                </b>
            </xsl:for-each>
        </xsl:template>
        
        <xsl:template match="جدول">
            <table border="1" ><xsl:apply-templates select="صف"/></table>
        </xsl:template>
        <xsl:template match="صف"  >
            <tr><xsl:apply-templates select="خانة"/></tr>
        </xsl:template>
        
        <xsl:template match="خانة">
            
            
            
            
            <xsl:choose>
                <xsl:when test="@ربط">
                    <xsl:variable name="NoOfmerge" select="@ربط"/>
                    <xsl:variable name="FinalOfmerge" select="substring($NoOfmerge,2)"/>
                    
                    <xsl:if test="starts-with($NoOfmerge, '0')">
                        <td colspan="{$FinalOfmerge}">
                            <xsl:choose>
                                <xsl:when test="توسيط">
                                    
                                    <center>
                                        <xsl:apply-templates select="node()"/>
                                    </center>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="node()"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                            
                            
                            
                            
                        </td>
                    </xsl:if>
                    <xsl:if test="starts-with($NoOfmerge, '1')">
                        <td rowspan="{$FinalOfmerge}">
                            <xsl:choose>
                                <xsl:when test="توسيط">
                                    
                                    <center>
                                        <xsl:apply-templates select="node()"/>
                                    </center>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="node()"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                        </td>
                    </xsl:if>
                    
                </xsl:when>
                <xsl:otherwise>
                    <td>
                        
                        <xsl:choose>
                            <xsl:when test="توسيط">
                                
                                <center>
                                    <xsl:apply-templates select="node()"/>
                                </center>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="node()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                    </td>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:template>	
        
</xsl:stylesheet>

