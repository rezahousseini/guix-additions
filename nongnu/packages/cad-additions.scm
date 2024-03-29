(define-module (nongnu packages cad-additions)
  #:use-module (guix packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bootstrap)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages xml)
  #:use-module (guix download)
  #:use-module (guix build utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary)
  #:use-module ((nonguix licenses) #:prefix license:)
  #:use-module (ice-9 ftw))

(define-public moldex3d
  (package
    (name "moldex3d")
    (version "2022.R3")
    (source (origin
              (method url-fetch)
              (uri (string-append
		    "ftp://shpc0002.hsr.ch/moldex/Moldex3DLinux_"
		    (string-replace-substring version "." "")
		    "_el8_64Bit_Portable.tar.gz"))
              (sha256
               (base32
		"0avwxnsrl1ly2dj4k55zv7km0ssa5126hxb6ldlljgic8sa0lajs"))))
    (build-system binary-build-system)
    (arguments
     (let* ((major (version-major version))
	    (root (string-append major "/x64/"))
	    (newroot (string-append "share/Moldex3D/" root))
	    (patchelf-inputs
	     '("gcc"
	       "gcc-toolchain"
	       "glibc"
	       "out"
	       "zlib"
	       ;;"libfabric"
	       ;;"arpack-ng"
	       "sqlite"
	       ;;"tinyxml2"
	       ;;"sqlcipher"
	       ;;"pugixml"
	       "util-linux"
	       "rdma-core"
	       ;;"mpich"
	       )))
       (list
	#:strip-binaries? #f
	#:phases
	#~(modify-phases %standard-phases
	    (add-after 'install 'create-symlinks
	      (lambda _
		(let* ((binaries (find-files
				  (string-append #$output "/" #$newroot "Bin")))
		       (libraries (find-files
				   (string-append #$output "/" #$newroot "Lib")))
		       (binpath (string-append #$output "/bin"))
		       (libpath (string-append #$output "/lib")))
		  (mkdir-p binpath)
		  (mkdir-p libpath)
		  (for-each (lambda (bin)
			      (symlink bin (string-append binpath "/" (basename bin))))
			    binaries)
		  (for-each (lambda (lib)
			      (symlink lib (string-append libpath "/" (basename lib))))
			    libraries)))))
	#:install-plan
	#~(list
	   (list #$root #$newroot
		 #:exclude '(;;"libarpack.so"
		 	     ;;"libtinyxml2.so"
		 	     "libsqlite3.so"
		 	     ;;"libsqlcipher.so"
		 	     ;;"libpugixml.so"
		 	     ;;"libmpi.so.12"
		 	     ;;"libmpifort.so.12"
		 	     ;;"libmpifort.so.12.0.0"
		 	     ;;"libfabric.so.1"
			     )))
	#:patchelf-plan
	#~(map (lambda (file)
		 (cons (string-append #$root file) '(#$patchelf-inputs)))
	       '("Lib/Intel/libefa-fi.so"
		 "Lib/Intel/libfabric.so.1"
		 "Lib/Intel/libifcore.so.5"
		 "Lib/Intel/libifcoremt.so.5"
		 "Lib/Intel/libifport.so.5"
		 "Lib/Intel/libimf.so"
		 "Lib/Intel/libintlc.so.5"
		 "Lib/Intel/libiomp5.so"
		 "Lib/Intel/librxm-fi.so"
		 "Lib/Intel/libsockets-fi.so"
		 "Lib/Intel/libsvml.so"
		 "Lib/Intel/libtcp-fi.so"
		 "Lib/Intel/libverbs-fi.so"
		 
		 "Lib/libCMDXStressSolverTool.so"
		 "Lib/libDSNR_Advisor.drpn.so"
		 "Lib/libDSNR_FIO.drpn.so"
		 "Lib/libDSNR_FIO2.drpn.so"
		 "Lib/libDSNR_Plugin.so"
		 "Lib/libDSNR_Simulation.drpn.so"
		 "Lib/libDSNR_StrRsc.so"
		 "Lib/libDSNR_algoWrapper.drpn.so"
		 "Lib/libDSNR_app.so"
		 "Lib/libHSPIO.so"
		 "Lib/libHWLibs.so"
		 "Lib/libIWG.so"
		 "Lib/libMDX3CPILA.so"
		 "Lib/libMDX3DBuckling.so"
		 "Lib/libMDX3DBucklingAnalysis.so"
		 "Lib/libMDX3DCOMTools.so"
		 "Lib/libMDX3DCoolE.so"
		 "Lib/libMDX3DCoolTools.so"
		 "Lib/libMDX3DCrystall.so"
		 "Lib/libMDX3DCtrl.so"
		 "Lib/libMDX3DDOEFileIO.so"
		 "Lib/libMDX3DDefault3PointBC.so"
		 "Lib/libMDX3DFEAReadFile.so"
		 "Lib/libMDX3DFEM.so"
		 "Lib/libMDX3DFEMDll.so"
		 "Lib/libMDX3DFiber.so"
		 "Lib/libMDX3DFiniteVolumeMesh.so"
		 "Lib/libMDX3DFlowETemperature.so"
		 "Lib/libMDX3DFlowE_UVWP.so"
		 "Lib/libMDX3DFlowField.so"
		 "Lib/libMDX3DFlowResult_Processor.so"
		 "Lib/libMDX3DGV.so"
		 "Lib/libMDX3DGradOp.so"
		 "Lib/libMDX3DI2MappingEngine.so"
		 "Lib/libMDX3DIBM.so"
		 "Lib/libMDX3DKNMat.so"
		 "Lib/libMDX3DMAFVM.so"
		 "Lib/libMDX3DMOSK.so"
		 "Lib/libMDX3DMatSum.so"
		 "Lib/libMDX3DMathTool.so"
		 "Lib/libMDX3DMatrixSolver.so"
		 "Lib/libMDX3DMeshlessShapeFunc.so"
		 "Lib/libMDX3DMeshlessToolbox.so"
		 "Lib/libMDX3DMeshlessWeighting.so"
		 "Lib/libMDX3DMuCell.so"
		 "Lib/libMDX3DNonlinearWarp.so"
		 "Lib/libMDX3DPIM.so"
		 "Lib/libMDX3DParticleTracer.so"
		 "Lib/libMDX3DPreheatDll.so"
		 "Lib/libMDX3DRIMInletConversion.so"
		 "Lib/libMDX3DRS.so"
		 "Lib/libMDX3DRTM.so"
		 "Lib/libMDX3DResultEngine.so"
		 "Lib/libMDX3DSCOH.so"
		 "Lib/libMDX3DSolverAPI.so"
		 "Lib/libMDX3DSolverAPIMathTool.so"
		 "Lib/libMDX3DSolverAPI_Fiber.so"
		 "Lib/libMDX3DSolverAPI_Material.so"
		 "Lib/libMDX3DStressDll.so"
		 "Lib/libMDX3DTensor.so"
		 "Lib/libMDX3DTool.so"
		 "Lib/libMDX3DTurflow.so"
		 "Lib/libMDX3DWS.so"
		 "Lib/libMDX3DWarpCoordTransformation.so"
		 "Lib/libMDX3DWarpDll.so"
		 "Lib/libMDX3DWarpFileIO.so"
		 "Lib/libMDX3DWarpMaterial.so"
		 "Lib/libMDX3DWarpSystem.so"
		 "Lib/libMDX3DWarpTools.so"
		 "Lib/libMDX3DWeldLine.so"
		 "Lib/libMDXAutoDesign.so"
		 "Lib/libMDXBarrelCompressibility.so"
		 "Lib/libMDXCADOp.so"
		 "Lib/libMDXCalTimeRemaining.so"
		 "Lib/libMDXCloudTool.so"
		 "Lib/libMDXCom.so"
		 "Lib/libMDXCommunication.so"
		 "Lib/libMDXComputationEngine_u.so"
		 "Lib/libMDXControllerKernel.so"
		 "Lib/libMDXCoolantChannel.so"
		 "Lib/libMDXCrc.so"
		 "Lib/libMDXCryptTool.so"
		 "Lib/libMDXDOE_toolkit.so"
		 "Lib/libMDXDrawSTLTool.so"
		 "Lib/libMDXExpertstate.so"
		 "Lib/libMDXFE2FV.so"
		 "Lib/libMDXFE2FVBase.so"
		 "Lib/libMDXFEM_ElemLib.so"
		 "Lib/libMDXFSI_Interface.so"
		 "Lib/libMDXFeatureSet.so"
		 "Lib/libMDXFindMeshBlockInterface.so"
		 "Lib/libMDXFlowCMP.so"
		 "Lib/libMDXFrmOut.so"
		 "Lib/libMDXG.so"
		 "Lib/libMDXGPUtool.so"
		 "Lib/libMDXG_oversee.so"
		 "Lib/libMDXHeaterControl.so"
		 "Lib/libMDXICExporter.so"
		 "Lib/libMDXIC_IO.so"
		 "Lib/libMDXJobSchedulerTool.so"
		 "Lib/libMDXKNCheck.so"
		 "Lib/libMDXKNCompParm.so"
		 "Lib/libMDXKNInterpolationTool.so"
		 "Lib/libMDXKNLEEngine.so"
		 "Lib/libMDXKNLogErrMsgTools.so"
		 "Lib/libMDXLinuxTool.so"
		 "Lib/libMDXLocale.so"
		 "Lib/libMDXLogReader.so"
		 "Lib/libMDXMFVBase.so"
		 "Lib/libMDXMFVDMP.so"
		 "Lib/libMDXMFVFileIO.so"
		 "Lib/libMDXMFVMixTools.so"
		 "Lib/libMDXMFVPar.so"
		 "Lib/libMDXMFVProcessor.so"
		 "Lib/libMDXMHGridEngine.so"
		 "Lib/libMDXMPITool.so"
		 "Lib/libMDXMachinePerformancePredictor.so"
		 "Lib/libMDXMachinePredictorEngine.so"
		 "Lib/libMDXMatWzGraphKN.so"
		 "Lib/libMDXMeshDe.so"
		 "Lib/libMDXMeshFormatTransfer.so"
		 "Lib/libMDXMesher.so"
		 "Lib/libMDXMesherInterface.so"
		 "Lib/libMDXMetis.so"
		 "Lib/libMDXNetSession.so"
		 "Lib/libMDXOptKer.so"
		 "Lib/libMDXPROEngine.so"
		 "Lib/libMDXPROLogString.so"
		 "Lib/libMDXParticleTracerReader.so"
		 "Lib/libMDXPlastification.so"
		 "Lib/libMDXPowerManagement.so"
		 "Lib/libMDXProCore.so"
		 "Lib/libMDXProcessCleaner.so"
		 "Lib/libMDXProjectSkim.so"
		 "Lib/libMDXRCM.so"
		 "Lib/libMDXRCTransferFileList.so"
		 "Lib/libMDXResultExtractor.so"
		 "Lib/libMDXSBCIO.so"
		 "Lib/libMDXSLDMOp.so"
		 "Lib/libMDXSRFMOp.so"
		 "Lib/libMDXSchedulerTool.so"
		 "Lib/libMDXSolverArgumentTool.so"
		 "Lib/libMDXSolverEvents.so"
		 "Lib/libMDXSolverLicenseTool.so"
		 "Lib/libMDXSolverProjectSkim.so"
		 "Lib/libMDXSolverSQLiteTool.so"
		 "Lib/libMDXStressInterface.so"
		 "Lib/libMDXThick.so"
		 "Lib/libMDXThickGen.so"
		 "Lib/libMDXTimeTool.so"
		 "Lib/libMDXUI_Interface.so"
		 "Lib/libMDXUnicodeTool.so"
		 "Lib/libMDXWeldline.so"
		 "Lib/libMDX_FEAIO.so"
		 "Lib/libMDX_MDGFileIO.so"
		 "Lib/libMFEIO.so"
		 "Lib/libMFESum.so"
		 "Lib/libMFEXT.so"
		 "Lib/libMFEXT_extend.so"
		 "Lib/libMSHIO.so"
		 "Lib/libMSHSum.so"
		 "Lib/libMVUI_toolkit.so"
		 "Lib/libMdx3DAMR.so"
		 "Lib/libMdx3DFlowPack.so"
		 "Lib/libMdx3DInterpolation.so"
		 "Lib/libMdx3DVolF.so"
		 "Lib/libMdxMaterialCheck.so"
		 "Lib/libMdxMatrEngine.so"
		 "Lib/libProgressController.so"
		 "Lib/libRSCIO.so"
		 "Lib/libRSPIO.so"
		 "Lib/libRSWIO.so"
		 "Lib/libVoxelRefinement.so"
		 "Lib/libarpack.so"
		 "Lib/libcudart.so.11.2.72"
		 "Lib/libkernel_apis.so"
		 "Lib/libkernel_modules.so"
		 "Lib/libkernel_problems.so"
		 "Lib/libkernel_resources.so"
		 "Lib/libkernel_solutions.so"
		 "Lib/libkernel_utilities.so"
		 "Lib/libmeshgems.so"
		 "Lib/libmeshgems_stubs.so"
		 "Lib/libmg-adapt.so" ;; SALOME?
		 "Lib/libmg-cadsurf.so"
		 "Lib/libmg-cleaner.so"
		 "Lib/libmg-hexa.so"
		 "Lib/libmg-surfopt.so"
		 "Lib/libmg-tetra.so"
		 "Lib/libmkl_core.so"
		 "Lib/libmkl_def.so"
		 "Lib/libmkl_intel_lp64.so"
		 "Lib/libmkl_intel_thread.so"
		 "Lib/libmkl_rt.so"
		 "Lib/libmkl_sequential.so"
		 "Lib/libmpi.so.12"
		 "Lib/libmpifort.so.12.0.0"
		 "Lib/libmx3NLib.so"
		 "Lib/libmx3NMTLib.so"
		 "Lib/libpugixml.so"
		 "Lib/libsamgp.so"
		 "Lib/libsamgp_interface.so"
		 "Lib/libsqlcipher.so"
		 ;;"Lib/libsqlite3.so"
		 "Lib/libtinyxml2.so"
		 
		 "Bin/IMB-MPI1"
		 "Bin/IntelMPI/hydra_bstrap_proxy"
		 "Bin/IntelMPI/hydra_nameserver"
		 "Bin/IntelMPI/hydra_pmi_proxy"
		 "Bin/IntelMPI/mpiexec.hydra"
		 "Bin/MDX3DBuckling"
		 "Bin/MDX3DCool"
		 "Bin/MDX3DFrozenLayer"
		 "Bin/MDX3DIC"
		 "Bin/MDX3DICPS"
		 "Bin/MDX3DLMUtil"
		 "Bin/MDX3DMFEFV"
		 "Bin/MDX3DProcessSimulation"
		 "Bin/MDX3DStress"
		 "Bin/MDX3DWDLWriter"
		 "Bin/MDX3DWarp"
		 "Bin/MDXAutoDesign"
		 "Bin/MDXEnvCheck"
		 "Bin/MDXFE2FVExe"
		 "Bin/MDXMFVParExe"
		 "Bin/MDXSolverCleaner"
		 "Bin/MDXSolverCommandlineTool"
		 "Bin/MDXSolverSQLiteConsole"
		 "Bin/MDXWarp"
		 "Bin/MDX_FSI"
		 "Bin/MDXoptics"
		 "Bin/Mdx3DFlow"
		 "Bin/Mdx3DFlowE"
		 "Bin/Mdx3DPack"
		 "Bin/Mdx3DQuickFlow"
		 "Bin/Mdx3dcoolfastE"
		 "Bin/mdxcool"
		 "Bin/mdxpack")))))
    (supported-systems '("x86_64-linux"))
    (inputs
     (list (list gcc "lib")
	   gcc-toolchain ;; ld-linux.so
	   glibc
	   zlib
	   ;;arpack-ng
	   sqlite
	   ;;tinyxml2
	   ;;sqlcipher
	   ;;libfabric
	   ;;pugixml
	   ;;mpich
	   (list util-linux "lib")
	   rdma-core
	   ))
    (synopsis "Moldex3D is the world leading CAE product for the plastics injection molding industry")
    (description
     "Moldex3D is the world leading CAE product for the plastics injection molding industry. With the best-in-class analysis technology, Moldex3D can help you simulate the widest application range of injection molding processes to optimize product design and manufacturability, shorten time-to-market, and maximize product ROI.")
    (home-page "https://www.moldex3d.com/")
    (license (license:nonfree "No URL"))))


;;(define-public timpi
;;  (package
;;   (name "timpi")
;;   (version "1.8.5")
;;   (source (origin
;;	    (method url-fetch)
;;	    (uri (string-append
;;		  "https://github.com/libMesh/TIMPI/archive/refs/tags/v"
;;		  version ".tar.gz"))
;;	    (file-name (string-append "v" version ".tar.gz"))
;;	    (sha256
;;	     (base32 "191rcc96n6bb1skivv4q1py4r3kk8sdhrgj4v5azs736l79dkwc0"))))
;;   (build-system gnu-build-system)
;;   ;;(arguments
;;   ;; `(#:phases
;;   ;;   (modify-phases %standard-phases
;;   ;;	 (add-after 'unpack 'remove-packaged-dependencies
;;   ;;	   (lambda _
;;   ;;	     (delete-file-recursively "contrib"))
;;   ;;	   ))))
;;   ;;(native-inputs (list m4 gfortran-toolchain openmpi))
;;   (home-page "http://libmesh.github.io")
;;   (synopsis
;;    "Templated Interface to MPI")
;;   (description
;;    "Templated Interface to MPI")
;;   (license license:lgpl2.1)))
;;
;;(define-public libmesh
;;  (package
;;   (name "libmesh")
;;   (version "1.7.1")
;;   (source (origin
;;	    (method url-fetch)
;;	    (uri (string-append
;;		  "https://github.com/libMesh/libmesh/releases/download/v"
;;		  version "/libmesh-" version ".tar.gz"))
;;	    (file-name (string-append name "-" version ".tar.gz"))
;;	    (sha256
;;	     (base32 "0q5hypvxvyk5bkjki7xk8pmf0xfzxmpd8kq6j25kgls9y59wq4yz"))
;;	    (modules '((guix build utils)))
;;	    (snippet
;;    	     '(begin
;;    		;; delete bundled dependencies
;;		(delete-file-recursively "contrib")))))
;;   (build-system gnu-build-system)
;;   ;;(arguments
;;   ;; `(#:phases
;;   ;;   (modify-phases %standard-phases
;;   ;;	 (add-after 'unpack 'remove-packaged-dependencies
;;   ;;	   (lambda _
;;   ;;	     (delete-file-recursively "contrib"))
;;   ;;	   ))))
;;   (native-inputs (list m4 gfortran-toolchain openmpi))
;;   (home-page "http://libmesh.github.io")
;;   (synopsis
;;    "The libMesh library provides a framework for the numerical simulation of partial differential equations using arbitrary unstructured discretizations on serial and parallel platforms.")
;;   (description
;;    "The libMesh library provides a framework for the numerical simulation of partial differential equations using arbitrary unstructured discretizations on serial and parallel platforms. A major goal of the library is to provide support for adaptive mesh refinement (AMR) computations in parallel while allowing a research scientist to focus on the physics they are modeling.")
;;   (license license:lgpl2.1)))

moldex3d
