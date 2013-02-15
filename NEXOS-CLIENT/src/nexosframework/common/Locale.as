package nexosframework.common {
  import mx.resources.IResourceManager;
  import mx.controls.Alert;
  import mx.collections.ArrayCollection;

/**
 * <p>Locale</p>
 * <p>Description: Locale 설정을 위한 Resource Propertis조정 Class</p>
 * <p>Copyright: Copyright(c) 2010</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br/>
 * -------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 *  1.0         2008-07-03  Lee Kyung-woo     신규작성<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 */ 
  public class Locale{
    
    /**
    * 현재 설정된 Locale정보
    */
    public static var CurrentLocale:String;
    
    /**
    * Constructor
    */
    public function Locale(){
    }
    
    /**
    * 기본 ResourceBundle을 설정합니다.
    */ 
    public static function setDefaultResourceBundle(resourceManager:IResourceManager):void {
      
      if(ConstClass.RESOURCE==null || ConstClass.RESOURCE.length==0){
        Alert.show("리소스 데이터가 로딩되어 있지 않습니다. 확인해주세요.");
        /*
        * 2012-10-05
        * 이경우
        * 소스 정리(다국어 미처리)로 주석처리
        Alert.show(ResourceData.source["Locale.ZM0001"]);
        */
        return;
      }
      
      var strLocaleChain:String = "en_US";
      
      var acResource:ArrayCollection = ConstClass.RESOURCE;
      
      //1. CairngormMessages
      if(resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages")!=null) {      
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0001E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0001E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0002E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0002E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0003E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0003E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0004E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0004E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0005E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0005E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0006E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0006E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0007E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0007E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0008E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0008E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0009E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0009E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0010E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0010E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0012E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0012E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0013E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0013E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0014E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0014E"];
        resourceManager.getResourceBundle(strLocaleChain,"CairngormMessages").content["C0015E"]        = ConstClass.RESOURCE[0]["CairngormMessages.content.C0015E"];
      }
      
      //2. collections
      if(resourceManager.getResourceBundle(strLocaleChain,"collections")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["bookmarkInvalid"       ]        = ConstClass.RESOURCE[0]["collections.content.bookmarkInvalid"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["bookmarkNotFound"      ]        = ConstClass.RESOURCE[0]["collections.content.bookmarkNotFound"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["findCondition"         ]        = ConstClass.RESOURCE[0]["collections.content.findCondition"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["findRestriction"       ]        = ConstClass.RESOURCE[0]["collections.content.findRestriction"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["incorrectAddition"     ]        = ConstClass.RESOURCE[0]["collections.content.incorrectAddition"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["invalidCursor"         ]        = ConstClass.RESOURCE[0]["collections.content.invalidCursor"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["invalidIndex"          ]        = ConstClass.RESOURCE[0]["collections.content.invalidIndex"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["invalidInsert"         ]        = ConstClass.RESOURCE[0]["collections.content.invalidInsert"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["invalidRemove"         ]        = ConstClass.RESOURCE[0]["collections.content.invalidRemove"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["invalidType"           ]        = ConstClass.RESOURCE[0]["collections.content.invalidType"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["itemNotFound"          ]        = ConstClass.RESOURCE[0]["collections.content.itemNotFound"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["noComparator"          ]        = ConstClass.RESOURCE[0]["collections.content.noComparator"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["noComparatorSortField" ]        = ConstClass.RESOURCE[0]["collections.content.noComparatorSortField"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["noItems"               ]        = ConstClass.RESOURCE[0]["collections.content.noItems"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["nonUnique"             ]        = ConstClass.RESOURCE[0]["collections.content.nonUnique"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["outOfBounds"           ]        = ConstClass.RESOURCE[0]["collections.content.outOfBounds"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["unknownMode"           ]        = ConstClass.RESOURCE[0]["collections.content.unknownMode"];
        resourceManager.getResourceBundle(strLocaleChain,"collections").content["unknownProperty"       ]        = ConstClass.RESOURCE[0]["collections.content.unknownProperty"];
      }
      
      //3. components
      if(resourceManager.getResourceBundle(strLocaleChain,"components")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"components").content["addChildAtDataGroupError"           ]= ConstClass.RESOURCE[0]["components.content.addChildAtDataGroupError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["addChildAtError"                    ]= ConstClass.RESOURCE[0]["components.content.addChildAtError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["addChildDataGroupError"             ]= ConstClass.RESOURCE[0]["components.content.addChildDataGroupError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["addChildError"                      ]= ConstClass.RESOURCE[0]["components.content.addChildError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["cannotAddYourselfAsYourChild"       ]= ConstClass.RESOURCE[0]["components.content.cannotAddYourselfAsYourChild"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["cannotDisplayVisualElement"         ]= ConstClass.RESOURCE[0]["components.content.cannotDisplayVisualElement"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["elementNotFoundInGroup"             ]= ConstClass.RESOURCE[0]["components.content.elementNotFoundInGroup"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["elementNotFoundInScroller"          ]= ConstClass.RESOURCE[0]["components.content.elementNotFoundInScroller"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["indexOutOfRange"                    ]= ConstClass.RESOURCE[0]["components.content.indexOutOfRange"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["layoutReadOnly"                     ]= ConstClass.RESOURCE[0]["components.content.layoutReadOnly"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["mxmlElementNoMultipleParents"       ]= ConstClass.RESOURCE[0]["components.content.mxmlElementNoMultipleParents"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["objectNotFoundInDisplayLayer"       ]= ConstClass.RESOURCE[0]["components.content.objectNotFoundInDisplayLayer"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["operationNotSupported"              ]= ConstClass.RESOURCE[0]["components.content.operationNotSupported"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["removeChildAtDataGroupError"        ]= ConstClass.RESOURCE[0]["components.content.removeChildAtDataGroupError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["removeChildAtError"                 ]= ConstClass.RESOURCE[0]["components.content.removeChildAtError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["removeChildDataGroupError"          ]= ConstClass.RESOURCE[0]["components.content.removeChildDataGroupError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["removeChildError"                   ]= ConstClass.RESOURCE[0]["components.content.removeChildError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["requiredSkinPartNotFound"           ]= ConstClass.RESOURCE[0]["components.content.requiredSkinPartNotFound"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["scaleGridGroupError"                ]= ConstClass.RESOURCE[0]["components.content.scaleGridGroupError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["setChildIndexDataGroupError"        ]= ConstClass.RESOURCE[0]["components.content.setChildIndexDataGroupError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["setChildIndexError"                 ]= ConstClass.RESOURCE[0]["components.content.setChildIndexError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["skinNotFound"                       ]= ConstClass.RESOURCE[0]["components.content.skinNotFound"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["sliderPageDownAccName"              ]= ConstClass.RESOURCE[0]["components.content.sliderPageDownAccName"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["sliderPageLeftAccName"              ]= ConstClass.RESOURCE[0]["components.content.sliderPageLeftAccName"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["sliderPageRightAccName"             ]= ConstClass.RESOURCE[0]["components.content.sliderPageRightAccName"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["sliderPageUpAccName"                ]= ConstClass.RESOURCE[0]["components.content.sliderPageUpAccName"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["sliderPositionAccName"              ]= ConstClass.RESOURCE[0]["components.content.sliderPositionAccName "];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["spinnerLessAccName"                 ]= ConstClass.RESOURCE[0]["components.content.spinnerLessAccName"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["spinnerMoreAccName"                 ]= ConstClass.RESOURCE[0]["components.content.spinnerMoreAccName"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["swapChildrenAtDataGroupError"       ]= ConstClass.RESOURCE[0]["components.content.swapChildrenAtDataGroupError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["swapChildrenAtError"                ]= ConstClass.RESOURCE[0]["components.content.swapChildrenAtError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["swapChildrenDataGroupError"         ]= ConstClass.RESOURCE[0]["components.content.swapChildrenDataGroupError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["swapChildrenError"                  ]= ConstClass.RESOURCE[0]["components.content.swapChildrenError"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["unableToCreateRenderer"             ]= ConstClass.RESOURCE[0]["components.content.unableToCreateRenderer"];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["videoPlayerFullScreenButtonAccName" ]= ConstClass.RESOURCE[0]["components.content.videoPlayerFullScreenButtonAccName "];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["videoPlayerMuteButtonAccName"       ]= ConstClass.RESOURCE[0]["components.content.videoPlayerMuteButtonAccName       "];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["videoPlayerPlayButtonAccName"       ]= ConstClass.RESOURCE[0]["components.content.videoPlayerPlayButtonAccName       "];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["videoPlayerScrubBarAccName"         ]= ConstClass.RESOURCE[0]["components.content.videoPlayerScrubBarAccName         "];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["videoPlayerVideoDisplayAccName"     ]= ConstClass.RESOURCE[0]["components.content.videoPlayerVideoDisplayAccName     "];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["videoPlayerVolumeBarAccName"        ]= ConstClass.RESOURCE[0]["components.content.videoPlayerVolumeBarAccName        "];
        resourceManager.getResourceBundle(strLocaleChain,"components").content["viewSource"                         ]= ConstClass.RESOURCE[0]["components.content.viewSource                         "];
      }
      
      //4. containers                                   
      if(resourceManager.getResourceBundle(strLocaleChain,"containers")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"containers").content["columnNotFound" ] = ConstClass.RESOURCE[0]["containers.content.columnNotFound"];
        resourceManager.getResourceBundle(strLocaleChain,"containers").content["noColumnsFound" ] = ConstClass.RESOURCE[0]["containers.content.noColumnsFound"];
        resourceManager.getResourceBundle(strLocaleChain,"containers").content["noRowsFound"    ] = ConstClass.RESOURCE[0]["containers.content.noRowsFound"];
        resourceManager.getResourceBundle(strLocaleChain,"containers").content["rowNotFound"    ] = ConstClass.RESOURCE[0]["containers.content.rowNotFound"];
      }
      
      //5. controls              
      if(resourceManager.getResourceBundle(strLocaleChain,"controls")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["badArgs"            ] = ConstClass.RESOURCE[0]["controls.content.badArgs"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["cancelLabel"        ] = ConstClass.RESOURCE[0]["controls.content.cancelLabel"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["cannotDisable"      ] = ConstClass.RESOURCE[0]["controls.content.cannotDisable"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["dayNamesShortest"   ] = ConstClass.RESOURCE[0]["controls.content.dayNamesShortest"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["errWrongContainer"  ] = ConstClass.RESOURCE[0]["controls.content.errWrongContainer"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["errWrongType"       ] = ConstClass.RESOURCE[0]["controls.content.errWrongType"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["errorMessages"      ] = ConstClass.RESOURCE[0]["controls.content.errorMessages"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["firstDayOfWeek"     ] = ConstClass.RESOURCE[0]["controls.content.firstDayOfWeek"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["incorrectType"      ] = ConstClass.RESOURCE[0]["controls.content.incorrectType"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["invalidCall"        ] = ConstClass.RESOURCE[0]["controls.content.invalidCall"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["label"              ] = ConstClass.RESOURCE[0]["controls.content.label"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["missingAttributeSrc"] = ConstClass.RESOURCE[0]["controls.content.missingAttributeSrc"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["missingAttributes"  ] = ConstClass.RESOURCE[0]["controls.content.missingAttributes"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["missingProxy"       ] = ConstClass.RESOURCE[0]["controls.content.missingProxy"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["missingRoot"        ] = ConstClass.RESOURCE[0]["controls.content.missingRoot"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["noLabel"            ] = ConstClass.RESOURCE[0]["controls.content.noLabel"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["notImplemented"     ] = ConstClass.RESOURCE[0]["controls.content.notImplemented"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["notLoadable"        ] = ConstClass.RESOURCE[0]["controls.content.notLoadable"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["notfpad"            ] = ConstClass.RESOURCE[0]["controls.content.notfpad"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["nullURL"            ] = ConstClass.RESOURCE[0]["controls.content.nullURL"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["okLabel"            ] = ConstClass.RESOURCE[0]["controls.content.okLabel"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["requiredField"      ] = ConstClass.RESOURCE[0]["controls.content.requiredField"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["rootNotFound"       ] = ConstClass.RESOURCE[0]["controls.content.rootNotFound"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["rootNotSMIL"        ] = ConstClass.RESOURCE[0]["controls.content.rootNotSMIL"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["tagNotFound"        ] = ConstClass.RESOURCE[0]["controls.content.tagNotFound"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["undefinedArray"     ] = ConstClass.RESOURCE[0]["controls.content.undefinedArray"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["undefinedParameter" ] = ConstClass.RESOURCE[0]["controls.content.undefinedParameter"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["unexpectedEnd"      ] = ConstClass.RESOURCE[0]["controls.content.unexpectedEnd"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["unknownInput"       ] = ConstClass.RESOURCE[0]["controls.content.unknownInput"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["unsupportedMode"    ] = ConstClass.RESOURCE[0]["controls.content.unsupportedMode"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["wrongDisabled"      ] = ConstClass.RESOURCE[0]["controls.content.wrongDisabled"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["wrongFormat"        ] = ConstClass.RESOURCE[0]["controls.content.wrongFormat"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["wrongIndex"         ] = ConstClass.RESOURCE[0]["controls.content.wrongIndex"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["wrongName"          ] = ConstClass.RESOURCE[0]["controls.content.wrongName"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["wrongNumParams"     ] = ConstClass.RESOURCE[0]["controls.content.wrongNumParams"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["wrongTime"          ] = ConstClass.RESOURCE[0]["controls.content.wrongTime"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["wrongTimeName"      ] = ConstClass.RESOURCE[0]["controls.content.wrongTimeName"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["wrongType"          ] = ConstClass.RESOURCE[0]["controls.content.wrongType"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["yearSymbol"         ] = ConstClass.RESOURCE[0]["controls.content.yearSymbol"];
        resourceManager.getResourceBundle(strLocaleChain,"controls").content["yesLabel"           ] = ConstClass.RESOURCE[0]["controls.content.yesLabel"];
      }
      
      //6. core                                         
      if(resourceManager.getResourceBundle(strLocaleChain,"core")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"core").content["badFile"                            ]= ConstClass.RESOURCE[0]["core.content.badFile"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["badIndex"                           ]= ConstClass.RESOURCE[0]["core.content.badIndex"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["badParameter"                       ]= ConstClass.RESOURCE[0]["core.content.badParameter"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["fontIncompatible"                   ]= ConstClass.RESOURCE[0]["core.content.fontIncompatible"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["multipleChildSets_ClassAndInstance" ]= ConstClass.RESOURCE[0]["core.content.multipleChildSets_ClassAndInstance"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["multipleChildSets_ClassAndSubclass" ]= ConstClass.RESOURCE[0]["core.content.multipleChildSets_ClassAndSubclass"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["notExecuting"                       ]= ConstClass.RESOURCE[0]["core.content.notExecuting"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["notImplementedInFTETextField"       ]= ConstClass.RESOURCE[0]["core.content.notImplementedInFTETextField"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["nullParameter"                      ]= ConstClass.RESOURCE[0]["core.content.nullParameter"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["stateUndefined"                     ]= ConstClass.RESOURCE[0]["core.content.stateUndefined"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["truncationIndicator"                ]= ConstClass.RESOURCE[0]["core.content.truncationIndicator"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["unsupportedTypeInFTETextField"      ]= ConstClass.RESOURCE[0]["core.content.unsupportedTypeInFTETextField"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["versionAlreadyRead"                 ]= ConstClass.RESOURCE[0]["core.content.versionAlreadyRead"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["versionAlreadySet"                  ]= ConstClass.RESOURCE[0]["core.content.versionAlreadySet"];
        resourceManager.getResourceBundle(strLocaleChain,"core").content["viewSource"                         ]= ConstClass.RESOURCE[0]["core.content.viewSource"];
      }
      
      //7. datamanagement
      if(resourceManager.getResourceBundle(strLocaleChain,"datamanagement")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"datamanagement").content["Branch"]        = ConstClass.RESOURCE[0]["datamanagement.content.Branch"];
      }
      
      //8. effects
      if(resourceManager.getResourceBundle(strLocaleChain,"effects")!=null){
        resourceManager.getResourceBundle(strLocaleChain,"effects").content["incorrectSource" ]      = ConstClass.RESOURCE[0]["effects.content.incorrectSource"];
        resourceManager.getResourceBundle(strLocaleChain,"effects").content["incorrectTrigger"]     = ConstClass.RESOURCE[0]["effects.content.incorrectTrigger"];
      }
      
      //9. formatters
      if(resourceManager.getResourceBundle(strLocaleChain,"formatters")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["am"                        ] = ConstClass.RESOURCE[0]["formatters.content.am"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["areaCode"                  ] = ConstClass.RESOURCE[0]["formatters.content.areaCode"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["areaCodeFormat"            ] = ConstClass.RESOURCE[0]["formatters.content.areaCodeFormat"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["currencyFormatterPrecision"] = ConstClass.RESOURCE[0]["formatters.content.currencyFormatterPrecision"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["dayNamesShort"             ] = ConstClass.RESOURCE[0]["formatters.content.dayNamesShort"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["defaultInvalidFormatError" ] = ConstClass.RESOURCE[0]["formatters.content.defaultInvalidFormatError"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["defaultInvalidValueError"  ] = ConstClass.RESOURCE[0]["formatters.content.defaultInvalidValueError"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["monthNamesShort"           ] = ConstClass.RESOURCE[0]["formatters.content.monthNamesShort"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["numberFormatterPrecision"  ] = ConstClass.RESOURCE[0]["formatters.content.numberFormatterPrecision"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["phoneNumberFormat"         ] = ConstClass.RESOURCE[0]["formatters.content.phoneNumberFormat"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["pm"                        ] = ConstClass.RESOURCE[0]["formatters.content.pm"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["rounding"                  ] = ConstClass.RESOURCE[0]["formatters.content.rounding"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["useNegativeSignInCurrency" ] = ConstClass.RESOURCE[0]["formatters.content.useNegativeSignInCurrency"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["useNegativeSignInNumber"   ] = ConstClass.RESOURCE[0]["formatters.content.useNegativeSignInNumber"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["useThousandsSeparator"     ] = ConstClass.RESOURCE[0]["formatters.content.useThousandsSeparator"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["validPatternChars"         ] = ConstClass.RESOURCE[0]["formatters.content.validPatternChars"];
        resourceManager.getResourceBundle(strLocaleChain,"formatters").content["zipCodeFormat"             ] = ConstClass.RESOURCE[0]["formatters.content.zipCodeFormat"];
      }
      
      //10. layout
      if(resourceManager.getResourceBundle(strLocaleChain,"layout")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"layout").content["basicLayoutNotVirtualized"    ]      = ConstClass.RESOURCE[0]["layout.content.basicLayoutNotVirtualized"];
        resourceManager.getResourceBundle(strLocaleChain,"layout").content["invalidIndex"                 ]      = ConstClass.RESOURCE[0]["layout.content.invalidIndex"];
      }
      
      //11. logging
      if(resourceManager.getResourceBundle(strLocaleChain,"logging")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"logging").content["charPlacement" ] = ConstClass.RESOURCE[0]["logging.content.charPlacement"];
        resourceManager.getResourceBundle(strLocaleChain,"logging").content["charsInvalid"  ] = ConstClass.RESOURCE[0]["logging.content.charsInvalid"];
        resourceManager.getResourceBundle(strLocaleChain,"logging").content["invalidChars"  ] = ConstClass.RESOURCE[0]["logging.content.invalidChars"];
        resourceManager.getResourceBundle(strLocaleChain,"logging").content["invalidLen"    ] = ConstClass.RESOURCE[0]["logging.content.invalidLen"];
        resourceManager.getResourceBundle(strLocaleChain,"logging").content["invalidTarget" ] = ConstClass.RESOURCE[0]["logging.content.invalidTarget"];
        resourceManager.getResourceBundle(strLocaleChain,"logging").content["levelLimit"    ] = ConstClass.RESOURCE[0]["logging.content.levelLimit"];
      }
      
      //12. messaging
      if(resourceManager.getResourceBundle(strLocaleChain,"messaging")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["AMFXTraitsNotFirst"                   ]= ConstClass.RESOURCE[0]["messaging.content.AMFXTraitsNotFirst"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["ackFailed"                            ]= ConstClass.RESOURCE[0]["messaging.content.ackFailed"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["ackFailed.details"                    ]= ConstClass.RESOURCE[0]["messaging.content.ackFailed.details"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["authenticationNotSupported"           ]= ConstClass.RESOURCE[0]["messaging.content.authenticationNotSupported"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["cannotAddNullIdChannelWhenClustered"  ]= ConstClass.RESOURCE[0]["messaging.content.cannotAddNullIdChannelWhenClustered"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["cannotAddWhenConfigured"              ]= ConstClass.RESOURCE[0]["messaging.content.cannotAddWhenConfigured"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["cannotConnectToDestination"           ]= ConstClass.RESOURCE[0]["messaging.content.cannotConnectToDestination"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["cannotRemoveWhenConfigured"           ]= ConstClass.RESOURCE[0]["messaging.content.cannotRemoveWhenConfigured"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["cannotSetClusteredWithdNullChannelIds"]= ConstClass.RESOURCE[0]["messaging.content.cannotSetClusteredWithdNullChannelIds"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["connectTimedOut"                      ]= ConstClass.RESOURCE[0]["messaging.content.connectTimedOut"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["consumerSubscribeError"               ]= ConstClass.RESOURCE[0]["messaging.content.consumerSubscribeError"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["couldNotAddMessageToQueue"            ]= ConstClass.RESOURCE[0]["messaging.content.couldNotAddMessageToQueue"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["couldNotClearCache"                   ]= ConstClass.RESOURCE[0]["messaging.content.couldNotClearCache"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["couldNotLoadCache"                    ]= ConstClass.RESOURCE[0]["messaging.content.couldNotLoadCache"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["couldNotLoadCacheIds"                 ]= ConstClass.RESOURCE[0]["messaging.content.couldNotLoadCacheIds"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["couldNotRemoveMessageFromQueue"       ]= ConstClass.RESOURCE[0]["messaging.content.couldNotRemoveMessageFromQueue"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["couldNotSaveCache"                    ]= ConstClass.RESOURCE[0]["messaging.content.couldNotSaveCache"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["deliveryInDoubt"                      ]= ConstClass.RESOURCE[0]["messaging.content.deliveryInDoubt"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["deliveryInDoubt.details"              ]= ConstClass.RESOURCE[0]["messaging.content.deliveryInDoubt.details"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["destinationNotSet"                    ]= ConstClass.RESOURCE[0]["messaging.content.destinationNotSet"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["destinationWithInvalidMessageType"    ]= ConstClass.RESOURCE[0]["messaging.content.destinationWithInvalidMessageType"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["emptyDestinationName"                 ]= ConstClass.RESOURCE[0]["messaging.content.emptyDestinationName"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["emptySessionClientId"                 ]= ConstClass.RESOURCE[0]["messaging.content.emptySessionClientId"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["errorReadingIExternalizable"          ]= ConstClass.RESOURCE[0]["messaging.content.errorReadingIExternalizable"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["failedToConnect"                      ]= ConstClass.RESOURCE[0]["messaging.content.failedToConnect"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["failedToSubscribe"                    ]= ConstClass.RESOURCE[0]["messaging.content.failedToSubscribe"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["httpRequestError"                     ]= ConstClass.RESOURCE[0]["messaging.content.httpRequestError"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["httpRequestError.details"             ]= ConstClass.RESOURCE[0]["messaging.content.httpRequestError.details"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["invalidRequestMethod"                 ]= ConstClass.RESOURCE[0]["messaging.content.invalidRequestMethod"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["invalidURL"                           ]= ConstClass.RESOURCE[0]["messaging.content.invalidURL"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["lsoStorageNotAllowed"                 ]= ConstClass.RESOURCE[0]["messaging.content.lsoStorageNotAllowed"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["messageQueueFailedInitialize"         ]= ConstClass.RESOURCE[0]["messaging.content.messageQueueFailedInitialize"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["messageQueueNotInitialized"           ]= ConstClass.RESOURCE[0]["messaging.content.messageQueueNotInitialized"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["messageQueueSendError"                ]= ConstClass.RESOURCE[0]["messaging.content.messageQueueSendError"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noAMFXBody"                           ]= ConstClass.RESOURCE[0]["messaging.content.noAMFXBody"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noAMFXNode"                           ]= ConstClass.RESOURCE[0]["messaging.content.noAMFXNode"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noAckMessage"                         ]= ConstClass.RESOURCE[0]["messaging.content.noAckMessage"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noAckMessage.details"                 ]= ConstClass.RESOURCE[0]["messaging.content.noAckMessage.details"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noAvailableChannels"                  ]= ConstClass.RESOURCE[0]["messaging.content.noAvailableChannels"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noChannelForDestination"              ]= ConstClass.RESOURCE[0]["messaging.content.noChannelForDestination"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noDestinationSpecified"               ]= ConstClass.RESOURCE[0]["messaging.content.noDestinationSpecified"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noErrorForMessage"                    ]= ConstClass.RESOURCE[0]["messaging.content.noErrorForMessage"];   
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noErrorForMessage.details"            ]= ConstClass.RESOURCE[0]["messaging.content.noErrorForMessage.details"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noServiceForMessageType"              ]= ConstClass.RESOURCE[0]["messaging.content.noServiceForMessageType"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noURIAllowed"                         ]= ConstClass.RESOURCE[0]["messaging.content.noURIAllowed"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["noURLSpecified"                       ]= ConstClass.RESOURCE[0]["messaging.content.noURLSpecified"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["notImplementingIExternalizable"       ]= ConstClass.RESOURCE[0]["messaging.content.notImplementingIExternalizable"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["pollingIntervalNonPositive"           ]= ConstClass.RESOURCE[0]["messaging.content.pollingIntervalNonPositive"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["pollingNotSupportedAMF"               ]= ConstClass.RESOURCE[0]["messaging.content.pollingNotSupportedAMF"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["pollingNotSupportedHTTP"              ]= ConstClass.RESOURCE[0]["messaging.content.pollingNotSupportedHTTP"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["pollingRequestNotAllowed"             ]= ConstClass.RESOURCE[0]["messaging.content.pollingRequestNotAllowed"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["producerConnectError"                 ]= ConstClass.RESOURCE[0]["messaging.content.producerConnectError"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["producerSendError"                    ]= ConstClass.RESOURCE[0]["messaging.content.producerSendError"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["producerSendErrorDetails"             ]= ConstClass.RESOURCE[0]["messaging.content.producerSendErrorDetails"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["queuedMessagesNotAllowedDetails"      ]= ConstClass.RESOURCE[0]["messaging.content.queuedMessagesNotAllowedDetails"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["receivedNull"                         ]= ConstClass.RESOURCE[0]["messaging.content.receivedNull"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["reconnectIntervalNegative"            ]= ConstClass.RESOURCE[0]["messaging.content.reconnectIntervalNegative"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["referenceMissingId"                   ]= ConstClass.RESOURCE[0]["messaging.content.referenceMissingId"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["requestTimedOut"                      ]= ConstClass.RESOURCE[0]["messaging.content.requestTimedOut"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["requestTimedOut.details"              ]= ConstClass.RESOURCE[0]["messaging.content.requestTimedOut.details"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["resubscribeIntervalNegative"          ]= ConstClass.RESOURCE[0]["messaging.content.resubscribeIntervalNegative"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["securityError"                        ]= ConstClass.RESOURCE[0]["messaging.content.securityError"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["securityError.details"                ]= ConstClass.RESOURCE[0]["messaging.content.securityError.details"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["sendFailed"                           ]= ConstClass.RESOURCE[0]["messaging.content.sendFailed"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["unknownChannelClass"                  ]= ConstClass.RESOURCE[0]["messaging.content.unknownChannelClass"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["unknownChannelWithId"                 ]= ConstClass.RESOURCE[0]["messaging.content.unknownChannelWithId"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["unknownDestination"                   ]= ConstClass.RESOURCE[0]["messaging.content.unknownDestination"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["unknownDestinationForService"         ]= ConstClass.RESOURCE[0]["messaging.content.unknownDestinationForService"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["unknownReference"                     ]= ConstClass.RESOURCE[0]["messaging.content.unknownReference"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["unknownStringReference"               ]= ConstClass.RESOURCE[0]["messaging.content.unknownStringReference"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["unknownTraitReference"                ]= ConstClass.RESOURCE[0]["messaging.content.unknownTraitReference"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["unsupportedAMFXVersion"               ]= ConstClass.RESOURCE[0]["messaging.content.unsupportedAMFXVersion"];
        resourceManager.getResourceBundle(strLocaleChain,"messaging").content["wrongMessageQueueForProducerDetails"  ]= ConstClass.RESOURCE[0]["messaging.content.wrongMessageQueueForProducerDetails"];
      }
      
      //13. modules
      //resourceManager.getResourceBundle(strLocaleChain,"modules").content["couldNotCreateModule"    ] = ConstClass.RESOURCE[0]["modules.content.couldNotCreateModule"];
      
      //14. rpc
      if(resourceManager.getResourceBundle(strLocaleChain,"rpc")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["badElement"                   ]= ConstClass.RESOURCE[0]["rpc.content.badElement"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["badSchemaNode"                ]= ConstClass.RESOURCE[0]["rpc.content.badSchemaNode"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["badType"                      ]= ConstClass.RESOURCE[0]["rpc.content.badType"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["cannotConnectToDestination"   ]= ConstClass.RESOURCE[0]["rpc.content.cannotConnectToDestination"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["cannotFindType"               ]= ConstClass.RESOURCE[0]["rpc.content.cannotFindType"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["cannotResetOperationName"     ]= ConstClass.RESOURCE[0]["rpc.content.cannotResetOperationName"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["cannotResetService"           ]= ConstClass.RESOURCE[0]["rpc.content.cannotResetService"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["defaultDecoderFailed"         ]= ConstClass.RESOURCE[0]["rpc.content.defaultDecoderFailed"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["destinationOrWSDLNotSpecified"]= ConstClass.RESOURCE[0]["rpc.content.destinationOrWSDLNotSpecified"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["errorWhileLoadingFromParent"  ]= ConstClass.RESOURCE[0]["rpc.content.errorWhileLoadingFromParent"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["faultyWSDLFormat"             ]= ConstClass.RESOURCE[0]["rpc.content.faultyWSDLFormat"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["invalidResultFormat"          ]= ConstClass.RESOURCE[0]["rpc.content.invalidResultFormat"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["invalidSoapResultFormat"      ]= ConstClass.RESOURCE[0]["rpc.content.invalidSoapResultFormat"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["missingInputParameter"        ]= ConstClass.RESOURCE[0]["rpc.content.missingInputParameter"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["missingInputParameterWithName"]= ConstClass.RESOURCE[0]["rpc.content.missingInputParameterWithName"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["multiplePortsFound"           ]= ConstClass.RESOURCE[0]["rpc.content.multiplePortsFound"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["mustSpecifyWSDLLocation"      ]= ConstClass.RESOURCE[0]["rpc.content.mustSpecifyWSDLLocation"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noBaseSchemaAddress"          ]= ConstClass.RESOURCE[0]["rpc.content.noBaseSchemaAddress"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noBaseWSDLAddress"            ]= ConstClass.RESOURCE[0]["rpc.content.noBaseWSDLAddress"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noBaseWSDLAddress.details"    ]= ConstClass.RESOURCE[0]["rpc.content.noBaseWSDLAddress.details"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noListenerForEvent"           ]= ConstClass.RESOURCE[0]["rpc.content.noListenerForEvent "];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noListenerForHeader"          ]= ConstClass.RESOURCE[0]["rpc.content.noListenerForHeader"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noPortsInWSDL"                ]= ConstClass.RESOURCE[0]["rpc.content.noPortsInWSDL"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noServiceAndPort"             ]= ConstClass.RESOURCE[0]["rpc.content.noServiceAndPort"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noServiceElement"             ]= ConstClass.RESOURCE[0]["rpc.content.noServiceElement"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noServiceElement.details"     ]= ConstClass.RESOURCE[0]["rpc.content.noServiceElement.details"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noServices"                   ]= ConstClass.RESOURCE[0]["rpc.content.noServices"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noSuchService"                ]= ConstClass.RESOURCE[0]["rpc.content.noSuchService"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["noSuchServiceInWSDL"          ]= ConstClass.RESOURCE[0]["rpc.content.noSuchServiceInWSDL"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["operationsNotAllowedInService"]= ConstClass.RESOURCE[0]["rpc.content.operationsNotAllowedInService"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["overloadedOperation"          ]= ConstClass.RESOURCE[0]["rpc.content.overloadedOperation"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["pendingCallExists"            ]= ConstClass.RESOURCE[0]["rpc.content.pendingCallExists"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["soapVersionMismatch"          ]= ConstClass.RESOURCE[0]["rpc.content.soapVersionMismatch"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["tooFewInputParameters"        ]= ConstClass.RESOURCE[0]["rpc.content.tooFewInputParameters"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unableToLoadWSDL"             ]= ConstClass.RESOURCE[0]["rpc.content.unableToLoadWSDL"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unexpectedException"          ]= ConstClass.RESOURCE[0]["rpc.content.unexpectedException"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unexpectedInputParameter"     ]= ConstClass.RESOURCE[0]["rpc.content.unexpectedInputParameter"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unexpectedSchemaException"    ]= ConstClass.RESOURCE[0]["rpc.content.unexpectedSchemaException"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unknownProtocol"              ]= ConstClass.RESOURCE[0]["rpc.content.unknownProtocol"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unknownSchemaElement"         ]= ConstClass.RESOURCE[0]["rpc.content.unknownSchemaElement"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unknownSchemaType"            ]= ConstClass.RESOURCE[0]["rpc.content.unknownSchemaType"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unknownSchemaVersion"         ]= ConstClass.RESOURCE[0]["rpc.content.unknownSchemaVersion"];   
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unrecognizedBindingName"      ]= ConstClass.RESOURCE[0]["rpc.content.unrecognizedBindingName"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unrecognizedMessageName"      ]= ConstClass.RESOURCE[0]["rpc.content.unrecognizedMessageName"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unrecognizedNamespace"        ]= ConstClass.RESOURCE[0]["rpc.content.unrecognizedNamespace"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["unrecognizedPortTypeName"     ]= ConstClass.RESOURCE[0]["rpc.content.unrecognizedPortTypeName"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["urlNotSpecified"              ]= ConstClass.RESOURCE[0]["rpc.content.urlNotSpecified"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["wsdlDefinitionsNotFirst"      ]= ConstClass.RESOURCE[0]["rpc.content.wsdlDefinitionsNotFirst"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["xmlDecodeReturnNull"          ]= ConstClass.RESOURCE[0]["rpc.content.xmlDecodeReturnNull"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["xmlEncodeReturnNoXMLNode"     ]= ConstClass.RESOURCE[0]["rpc.content.xmlEncodeReturnNoXMLNode"];
        resourceManager.getResourceBundle(strLocaleChain,"rpc").content["xmlEncodeReturnNull"          ]= ConstClass.RESOURCE[0]["rpc.content.xmlEncodeReturnNull"];
      }
      
      //15. SharedResources
      if(resourceManager.getResourceBundle(strLocaleChain,"SharedResources")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"SharedResources").content["alignSymbol"            ] = ConstClass.RESOURCE[0]["SharedResources.content.alignSymbol"];
        resourceManager.getResourceBundle(strLocaleChain,"SharedResources").content["currencySymbol"         ] = ConstClass.RESOURCE[0]["SharedResources.content.currencySymbol"];
        resourceManager.getResourceBundle(strLocaleChain,"SharedResources").content["dateFormat"             ] = ConstClass.RESOURCE[0]["SharedResources.content.dateFormat"];
        resourceManager.getResourceBundle(strLocaleChain,"SharedResources").content["dayNames"               ] = ConstClass.RESOURCE[0]["SharedResources.content.dayNames"];
        resourceManager.getResourceBundle(strLocaleChain,"SharedResources").content["decimalSeparatorFrom"   ] = ConstClass.RESOURCE[0]["SharedResources.content.decimalSeparatorFrom"];
        resourceManager.getResourceBundle(strLocaleChain,"SharedResources").content["decimalSeparatorTo"     ] = ConstClass.RESOURCE[0]["SharedResources.content.decimalSeparatorTo"];
        resourceManager.getResourceBundle(strLocaleChain,"SharedResources").content["monthNames"             ] = ConstClass.RESOURCE[0]["SharedResources.content.monthNames"];
        resourceManager.getResourceBundle(strLocaleChain,"SharedResources").content["monthSymbol"            ] = ConstClass.RESOURCE[0]["SharedResources.content.monthSymbol"];
        resourceManager.getResourceBundle(strLocaleChain,"SharedResources").content["thousandsSeparatorFrom" ] = ConstClass.RESOURCE[0]["SharedResources.content.thousandsSeparatorFrom"];
        resourceManager.getResourceBundle(strLocaleChain,"SharedResources").content["thousandsSeparatorTo"   ] = ConstClass.RESOURCE[0]["SharedResources.content.thousandsSeparatorTo"];
      }
      
      //16. skins
      if(resourceManager.getResourceBundle(strLocaleChain,"skins")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"skins").content["notLoaded"   ]       = ConstClass.RESOURCE[0]["skins.content.notLoaded"];
      }
      
      //17. styles
      if(resourceManager.getResourceBundle(strLocaleChain,"styles")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"styles").content["unableToLoad" ]     = ConstClass.RESOURCE[0]["styles.content.unableToLoad"];
      }
      
      //18. utils
      if(resourceManager.getResourceBundle(strLocaleChain,"utils")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"utils").content["partialBlockDropped"]   = ConstClass.RESOURCE[0]["utils.content.partialBlockDropped"];
      }
      
      //19. validators
      if(resourceManager.getResourceBundle(strLocaleChain,"validators")!=null) {
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["CNSAttribute"                              ] = ConstClass.RESOURCE[0]["validators.content.CNSAttribute"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["CTSAttribute"                              ] = ConstClass.RESOURCE[0]["validators.content.CTSAttribute"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["DSAttribute"                               ] = ConstClass.RESOURCE[0]["validators.content.DSAttribute"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["MSAttribute"                               ] = ConstClass.RESOURCE[0]["validators.content.MSAttribute"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["PAttributeMissing"                         ] = ConstClass.RESOURCE[0]["validators.content.PAttributeMissing"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["SAttribute"                                ] = ConstClass.RESOURCE[0]["validators.content.SAttribute"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["SAttributeMissing"                         ] = ConstClass.RESOURCE[0]["validators.content.SAttributeMissing"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["YSAttribute"                               ] = ConstClass.RESOURCE[0]["validators.content.YSAttribute"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["allowNegative"                             ] = ConstClass.RESOURCE[0]["validators.content.allowNegative"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["creditCardValidatorAllowedFormatChars"     ] = ConstClass.RESOURCE[0]["validators.content.creditCardValidatorAllowedFormatChars"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["currencySymbolError"                       ] = ConstClass.RESOURCE[0]["validators.content.currencySymbolError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["currencyValidatorPrecision"                ] = ConstClass.RESOURCE[0]["validators.content.currencyValidatorPrecision"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["dateValidatorAllowedFormatChars"           ] = ConstClass.RESOURCE[0]["validators.content.dateValidatorAllowedFormatChars"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["decimalPointCountError"                    ] = ConstClass.RESOURCE[0]["validators.content.decimalPointCountError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["decimalSeparator"                          ] = ConstClass.RESOURCE[0]["validators.content.decimalSeparator"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["exceedsMaxErrorCV"                         ] = ConstClass.RESOURCE[0]["validators.content.exceedsMaxErrorCV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["exceedsMaxErrorNV"                         ] = ConstClass.RESOURCE[0]["validators.content.exceedsMaxErrorNV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["fieldNotFound"                             ] = ConstClass.RESOURCE[0]["validators.content.fieldNotFound"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["formatError"                               ] = ConstClass.RESOURCE[0]["validators.content.formatError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["integerError"                              ] = ConstClass.RESOURCE[0]["validators.content.integerError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidCharError"                          ] = ConstClass.RESOURCE[0]["validators.content.invalidCharError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidCharErrorCCV"                       ] = ConstClass.RESOURCE[0]["validators.content.invalidCharErrorCCV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidCharErrorDV"                        ] = ConstClass.RESOURCE[0]["validators.content.invalidCharErrorDV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidCharErrorEV"                        ] = ConstClass.RESOURCE[0]["validators.content.invalidCharErrorEV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidCharErrorPNV"                       ] = ConstClass.RESOURCE[0]["validators.content.invalidCharErrorPNV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidCharErrorSSV"                       ] = ConstClass.RESOURCE[0]["validators.content.invalidCharErrorSSV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidCharErrorZCV"                       ] = ConstClass.RESOURCE[0]["validators.content.invalidCharErrorZCV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidDomainErrorEV"                      ] = ConstClass.RESOURCE[0]["validators.content.invalidDomainErrorEV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidDomainErrorZCV"                     ] = ConstClass.RESOURCE[0]["validators.content.invalidDomainErrorZCV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidFormatChars"                        ] = ConstClass.RESOURCE[0]["validators.content.invalidFormatChars"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidFormatCharsError"                   ] = ConstClass.RESOURCE[0]["validators.content.invalidFormatCharsError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidFormatCharsZCV"                     ] = ConstClass.RESOURCE[0]["validators.content.invalidFormatCharsZCV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidIPDomainError"                      ] = ConstClass.RESOURCE[0]["validators.content.invalidIPDomainError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidNumberError"                        ] = ConstClass.RESOURCE[0]["validators.content.invalidNumberError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["invalidPeriodsInDomainError"               ] = ConstClass.RESOURCE[0]["validators.content.invalidPeriodsInDomainError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["lowerThanMinError"                         ] = ConstClass.RESOURCE[0]["validators.content.lowerThanMinError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["maxLength"                                 ] = ConstClass.RESOURCE[0]["validators.content.maxLength"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["maxValue"                                  ] = ConstClass.RESOURCE[0]["validators.content.maxValue"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["minDigitsPNV"                              ] = ConstClass.RESOURCE[0]["validators.content.minDigitsPNV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["minLength"                                 ] = ConstClass.RESOURCE[0]["validators.content.minLength"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["minValue"                                  ] = ConstClass.RESOURCE[0]["validators.content.minValue"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["missingAtSignError"                        ] = ConstClass.RESOURCE[0]["validators.content.missingAtSignError"];   
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["missingCardNumber"                         ] = ConstClass.RESOURCE[0]["validators.content.missingCardNumber"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["missingCardType"                           ] = ConstClass.RESOURCE[0]["validators.content.missingCardType"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["missingPeriodInDomainError"                ] = ConstClass.RESOURCE[0]["validators.content.missingPeriodInDomainError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["missingUsernameError"                      ] = ConstClass.RESOURCE[0]["validators.content.missingUsernameError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["negativeError"                             ] = ConstClass.RESOURCE[0]["validators.content.negativeError    "];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["noExpressionError"                         ] = ConstClass.RESOURCE[0]["validators.content.noExpressionError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["noMatchError"                              ] = ConstClass.RESOURCE[0]["validators.content.noMatchError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["noNumError"                                ] = ConstClass.RESOURCE[0]["validators.content.noNumError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["noTypeError"                               ] = ConstClass.RESOURCE[0]["validators.content.noTypeError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["numberValidatorDomain"                     ] = ConstClass.RESOURCE[0]["validators.content.numberValidatorDomain"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["numberValidatorPrecision"                  ] = ConstClass.RESOURCE[0]["validators.content.numberValidatorPrecision"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["phoneNumberValidatorAllowedFormatChars"    ] = ConstClass.RESOURCE[0]["validators.content.phoneNumberValidatorAllowedFormatChars"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["precisionError"                            ] = ConstClass.RESOURCE[0]["validators.content.precisionError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["requiredFieldError"                        ] = ConstClass.RESOURCE[0]["validators.content.requiredFieldError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["separationError"                           ] = ConstClass.RESOURCE[0]["validators.content.separationError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["socialSecurityValidatorAllowedFormatChars" ] = ConstClass.RESOURCE[0]["validators.content.socialSecurityValidatorAllowedFormatChars"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["thousandsSeparator"                        ] = ConstClass.RESOURCE[0]["validators.content.thousandsSeparator"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["tooLongError"                              ] = ConstClass.RESOURCE[0]["validators.content.tooLongError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["tooManyAtSignsError"                       ] = ConstClass.RESOURCE[0]["validators.content.tooManyAtSignsError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["tooShortError"                             ] = ConstClass.RESOURCE[0]["validators.content.tooShortError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["validateAsString"                          ] = ConstClass.RESOURCE[0]["validators.content.validateAsString"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["wrongCAFormatError"                        ] = ConstClass.RESOURCE[0]["validators.content.wrongCAFormatError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["wrongDayError"                             ] = ConstClass.RESOURCE[0]["validators.content.wrongDayError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["wrongFormatError"                          ] = ConstClass.RESOURCE[0]["validators.content.wrongFormatError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["wrongLengthErrorCCV"                       ] = ConstClass.RESOURCE[0]["validators.content.wrongLengthErrorCCV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["wrongLengthErrorDV"                        ] = ConstClass.RESOURCE[0]["validators.content.wrongLengthErrorDV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["wrongLengthErrorPNV"                       ] = ConstClass.RESOURCE[0]["validators.content.wrongLengthErrorPNV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["wrongLengthErrorZCV"                       ] = ConstClass.RESOURCE[0]["validators.content.wrongLengthErrorZCV"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["wrongMonthError"                           ] = ConstClass.RESOURCE[0]["validators.content.wrongMonthError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["wrongTypeError"                            ] = ConstClass.RESOURCE[0]["validators.content.wrongTypeError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["wrongUSFormatError"                        ] = ConstClass.RESOURCE[0]["validators.content.wrongUSFormatError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["wrongYearError"                            ] = ConstClass.RESOURCE[0]["validators.content.wrongYearError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["zeroStartError"                            ] = ConstClass.RESOURCE[0]["validators.content.zeroStartError"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["zipCodeValidatorAllowedFormatChars"        ] = ConstClass.RESOURCE[0]["validators.content.zipCodeValidatorAllowedFormatChars"];
        resourceManager.getResourceBundle(strLocaleChain,"validators").content["zipCodeValidatorDomain"                    ] = ConstClass.RESOURCE[0]["validators.content.zipCodeValidatorDomain"];
      }
      
      resourceManager.update();
    }
  }
}