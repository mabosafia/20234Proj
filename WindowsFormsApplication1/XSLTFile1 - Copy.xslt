<?xml version="1.0" encoding="UTF-8"?>


 <xsl:stylesheet version="1.0"     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   >
     <xsl:template match="/">
         
         <html>
                  
             <head>
                 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, minimum-scale=1.0, user-scalable=1" />
     
                
             </head>
             <body style="padding:4px;text-align: justify;text-justify: inter-word;font-family:[fontName];font-size: [fontSize];background-color:[color];color:[MainColor];-webkit-text-size-adjust: none;" >
                 <div dir="rtl"  >
                     <xsl:apply-templates />
                 </div>
             </body>
         </html>
     </xsl:template>

   <xsl:template match="اقتباس">
     <xsl:apply-templates/>

   <xsl:variable name="VarAt">
                    <xsl:value-of select="string('@')" />
                  </xsl:variable>
                 <xsl:variable name="VarHash">
                    <xsl:value-of select="string('#')" />
                  </xsl:variable>
     
    <xsl:variable name="VarMainBookName">
       <xsl:value-of select="$VarAt"  />
     <xsl:choose>
       <xsl:when test="@bookid != ''" >

         <xsl:choose>
           <xsl:when test="@bookid = '58'" >السيرة النبوية لأبن هشام</xsl:when>
           <xsl:when test="@bookid = '59'" >البداية والنهاية</xsl:when>
           <xsl:when test="@bookid = '126'" >الكامل في التاريخ</xsl:when>
           <xsl:when test="@bookid = '127'" >زاد المعاد</xsl:when>
           <xsl:when test="@bookid = '420'" >سبل الهدى والرشاد في سيرة خير العباد</xsl:when>
           <xsl:when test="@bookid = '421'" >المنتظم في تاريخ الملوك والأمم</xsl:when>
           <xsl:when test="@bookid = '422'" >تاريخ الخلفاء</xsl:when>

           <xsl:otherwise> كتاب اخر</xsl:otherwise>
         </xsl:choose>


       </xsl:when>
       <xsl:otherwise>كتاب اخر</xsl:otherwise>
      
     </xsl:choose>
  <xsl:value-of select="$VarHash"  />
   <xsl:value-of select="@part"/>
 <xsl:value-of select="$VarHash"  />
 <xsl:choose>
  
       <xsl:when test="@pageFrom != @pageTo">
         <xsl:value-of select="@pageFrom"/>-<xsl:value-of select="@pageTo"/>
       </xsl:when>
       <xsl:otherwise>
         <xsl:value-of select="@pageFrom"/>
       </xsl:otherwise>
     </xsl:choose>
      
     <xsl:if test="descendant::إحالة">
       <xsl:for-each select="descendant::إحالة">
              <xsl:value-of select="$VarAt"  />

       
         <xsl:choose>
           <xsl:when test="@bookid != ''" >
             
             

               <xsl:choose>
                 <xsl:when test="@bookid = '58'" >السيرة النبوية لأبن هشام</xsl:when>
                 <xsl:when test="@bookid = '59'" >البداية والنهاية</xsl:when>
                 <xsl:when test="@bookid = '126'" >الكامل في التاريخ</xsl:when>
                 <xsl:when test="@bookid = '127'" >زاد المعاد</xsl:when>
                 <xsl:when test="@bookid = '420'" >سبل الهدى والرشاد في سيرة خير العباد</xsl:when>
                 <xsl:when test="@bookid = '421'" >المنتظم في تاريخ الملوك والأمم</xsl:when>
                 <xsl:when test="@bookid = '422'" >تاريخ الخلفاء</xsl:when>
                 
                 <xsl:otherwise> كتاب اخر</xsl:otherwise>
               </xsl:choose>








           </xsl:when>
           <xsl:otherwise> كتاب اخر</xsl:otherwise>
         </xsl:choose>
          <xsl:value-of select="$VarHash"  />
          <xsl:value-of select="@part"/>
         <xsl:value-of select="$VarHash"  />
         <xsl:choose>
           <xsl:when test="@pageFrom != @pageTo">
             <xsl:value-of select="@pageFrom"/>-<xsl:value-of select="@pageTo"/>
           </xsl:when>
           <xsl:otherwise>
             <xsl:value-of select="@pageFrom"/>
           </xsl:otherwise>
         </xsl:choose>

       </xsl:for-each>

     </xsl:if>

  
  </xsl:variable>
      
  <a id="hamishlink{generate-id()}"
                        href="index.html?id={$VarMainBookName}">
                        <img src="[Bookmark.png]" width="25" height="25" border="0"/>
                    </a>
                  <input type="hidden" id="#{generate-id()}" value="{$VarMainBookName}" />


   </xsl:template>
   
   
   
     <xsl:template match="عنوان-ف">
         <xsl:for-each select=".">
             <div dir="rtl" style="text-align:center;font-weight: bold;font-family:[fontName];color:[MainColor]" >
                 <xsl:value-of select="."/>
             </div>
         </xsl:for-each>
     </xsl:template>
     
     <xsl:template match="اسم">
         <xsl:for-each select=".">
             <span dir="rtl" style="color:[NameTagcolor]" >
                 <xsl:value-of select="."/>
             </span>
         </xsl:for-each>
     </xsl:template>
     
     <xsl:template match="صفحة">
         
         <span  dir="rtl" style="color:[PageTagcolor]" >
             [ص : <xsl:value-of select= "@رقم" />]
         </span>
         <br/>
     </xsl:template>
      
      
     <xsl:template match="هامش">
         <xsl:for-each select=".">
             <a id="hamishlink{generate-id()}"
                 href="index.html?id={0 + count(preceding-sibling::هامش)}">
                 <img src="Bookmark.png" width="25" height="25" border="0"/>
             </a>
             
             <input type="hidden" id="#{generate-id()}" value="{.}" />
         </xsl:for-each>
     </xsl:template>
     
      
     
     <xsl:template match="رأس"  >
         <xsl:for-each select=".">
             <span  class="SubjectRel"  id="Rabet{0 + count(preceding-sibling::رأس)}" >
                 <xsl:apply-templates select="node()"/>
                 
             </span>
             <xsl:variable name="RabetLinks"><xsl:value-of select="@ربط"/></xsl:variable>
             <input type="hidden"  value="@@@{$RabetLinks}@@@" id="hidRabet{0 + count(preceding-sibling::رأس)}">
                 
             </input>
             
         </xsl:for-each>
     </xsl:template>
     
     <xsl:template match="جغرافي"  >
         <xsl:for-each select=".">
             <span  class="GeographicRel"  id="GeogRabet{0 + count(preceding-sibling::جغرافي)}" >
                 <xsl:apply-templates select="node()"/>
                 
             </span>
             <xsl:variable name="GeographicLinks"><xsl:value-of select="@ربط"/></xsl:variable>
             <input type="hidden"  value="###{$GeographicLinks}###" id="hidGeogRabet{0 + count(preceding-sibling::جغرافي)}">
                 
             </input>
             
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
             
             <span dir="rtl" style="color:[QuranTagcolor]" >
                 <xsl:apply-templates select="node()" />
                 
             </span>
         </xsl:for-each>
     </xsl:template>
     
     <xsl:template match="متن-ح">
         <xsl:for-each select=".">
             <span dir="rtl" style="color:[MatnTagcolor]" >
                 <xsl:apply-templates select="node()"/>
                 
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
     
     
     
            <xsl:template match="شعر">
               
                
            <br/>
  <table style="width:100%;border: none;">
<xsl:for-each select="شطر">
    
                <xsl:variable name="CurrentCounter" select="position()"/>
                <xsl:if test="$CurrentCounter mod 2 = 1">
                 openrow
                       <td style=" width:45%;text-align:center;font-family:[fontName];font-size: [fontSize];">
                           <xsl:apply-templates select="."/>
                      </td>
     
                </xsl:if>
                <xsl:if test="$CurrentCounter mod 2 = 0">
                    <td style=" width:10%;">
</td>
<td style=" width:45%;text-align:center;font-family:[fontName];font-size: [fontSize];">
                 <xsl:apply-templates select="."/>
                      </td>
                      
                       
             
                     closerow
                </xsl:if>
                <xsl:if test="position() = last() and $CurrentCounter mod 2 = 1"  >
                closerow
                </xsl:if>
</xsl:for-each>
          </table>
 
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


